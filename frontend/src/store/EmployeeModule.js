export const EmployeeModule = {
  state: {
    user_id: null,
    first_name: null,
    last_name: null,
    role: null,
    email: null,
  },
  getters: {
    fullname: (state) => {
      return state.first_name || state.last_name
        ? state.first_name + ' ' + state.last_name
        : null
    }
  },
  mutations: {
    setEmployee(state, payload) {
      state.user_id = payload.id;
      state.first_name = payload.first_name;
      state.last_name = payload.last_name;
      state.email = payload.email;
      state.token = payload.token;
    }
  },
  actions: {
    setEmployee(context, employee) {
      context.commit('setEmployee', employee);
    }
  },
  modules: {
  }
}