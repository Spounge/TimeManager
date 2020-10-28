import Vue from 'vue'
import Vuex from 'vuex'

import { UserModule } from './UserModule';

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
  },
  mutations: {
  },
  actions: {
  },
  modules: {
    user: { namespaced: true, ...UserModule }
  }
})
