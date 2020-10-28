export const UserModule = {
  state: {
    user_id: null,
    first_name: null,
    last_name: null,
    email: null,
    token: null
  },
  mutations: {
    setUser(state, payload) {
      state.user_id = payload.id;
      state.first_name = payload.first_name;
      state.last_name = payload.last_name;
      state.email = payload.email;
      state.token = payload.token;
    }
  },
  actions: {
    setUser(context, user) {
      context.commit('setUser', user);
    }
  },
  modules: {
  }
}