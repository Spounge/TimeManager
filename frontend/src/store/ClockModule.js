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

      // TODO insert WorkingTimes { user_id: payload.currentUserId start: Date().now (, end: null) } into DB

    },
    stopTimer: (state) => {
      clearInterval(state.timerInterval);
      state.timerInterval = null;
      state.timer = 0;

      // TODO update WorkingTimes { user_id: payload.currentUserId, end: Date().now }
    }
  },
  actions: {
    startTimer: (context, currentUserId) => {
      context.commit('startTimer', { currentUserId });
    },
    stopTimer: (context, currentUserId) => {
      context.commit('stopTimer', { currentUserId });
    }
  },
  modules: {}
}