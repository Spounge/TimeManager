import { apiUrl } from '../config/environment';
import { UserModule } from './UserModule';

let hours;
let minutes;
let seconds;

export const ClockModule = {
  state: {
    timer: 0,
    timerInterval: null,
  },
  getters: {
    currentTime: (state) => {
      hours = Math.floor(state.timer / 3600);
      minutes = Math.floor((state.timer - (hours * 3600)) / 60);
      seconds = state.timer - (hours * 3600) - (minutes * 60);

      if (isNaN(hours) || isNaN(minutes) || isNaN(seconds)) {
        return "00:00:00";
      }

      if (hours < 10) hours = "0" + hours;
      if (minutes < 10) minutes = "0" + minutes;
      if (seconds < 10) seconds = "0" + seconds;

      return hours + ':' + minutes + ':' + seconds;
    },
  },
  mutations: {
    startTimer: (state) => {
      if (state.timerInterval) {
        clearInterval(state.timerInterval);
      }
      state.timerInterval = setInterval(() => {
        state.timer++;
      }, 1000);
    },
    stopTimer: (state) => {
      clearInterval(state.timerInterval);
      state.timerInterval = null;
      state.timer = 0;
    }
  },
  actions: {
    startTimer: (context, currentUserId) => {
      fetch(`${apiUrl}/working_times`, {
        method: 'POST',
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify({
          "working_time": {
            "start": new Date(),
            "user_id": UserModule.state.user_id
          }
        })
      }).then(res => res.json())
        .then(json => {
          console.log('START WORK', json);
          context.commit('startTimer', { currentUserId });
        })
        .catch(err => console.error(err));
    },
    stopTimer: (context, currentUserId) => {
      fetch(`${apiUrl}/working_times_by_user/stop/${UserModule.state.user_id}`, {
        method: 'PUT',
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify({
          "working_time": {
            "end": new Date(),
            "user_id": UserModule.state.user_id
          }
        })
      }).then(res => res.json())
        .then(json => {
          console.log('STOP WORK', json);
          context.commit('stopTimer', { currentUserId });
        })
        .catch(err => console.error(err));
    }
  },
  modules: {}
}