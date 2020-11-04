import Vue from 'vue'
import Vuex from 'vuex'

import { UserModule } from './UserModule';
import { EmployeeModule } from './EmployeeModule';
import { ClockModule } from './ClockModule';

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
  },
  mutations: {
  },
  actions: {
  },
  modules: {
    user: { namespaced: true, ...UserModule },
    employee: { namespaced: true, ...EmployeeModule },
    clock: { namespaced: true, ...ClockModule },
  }
})
