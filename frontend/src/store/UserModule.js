const rolesMap = {
  1: "Top Manager",
  2: "Manager",
  3: "Employee"
};

export const UserModule = {
  state: {
    user_id: null,
    first_name: null,
    last_name: null,
    role: null,
    email: null,
    token: null
  },
  // state: { // FAKE STATE
  //   user_id: 1,
  //   first_name: "John",
  //   last_name: "Doe",
  //   email: "john@doe.com",
  //   role: "Top Manager",
  //   token: "faketoken"
  // },
  getters: {
    fullname: (state) => {
      return state.first_name || state.last_name
        ? state.first_name + ' ' + state.last_name
        : null
    }
  },
  mutations: {
    setUser(state, payload) {
      state.user_id = payload.id;
      state.first_name = payload.first_name;
      state.last_name = payload.last_name;
      state.email = payload.email;
      state.token = payload.token;
      state.role = rolesMap[payload.role_id] || "Employee";
      console.log('setting user', state, payload);
    },
    logout(state) {
      state.user_id = null;
      state.first_name = null;
      state.last_name = null;
      state.email = null;
      state.token = null;
    }
  },
  actions: {
    setUser(context, user) {
      context.commit('setUser', user);
    },
    logout(context) {
      context.commit('logout');
    }
  },
  modules: {
  }
}