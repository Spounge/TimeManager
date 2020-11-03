import Vue from 'vue'
import VueRouter from 'vue-router'

import Dashboard from '../views/Dashboard.vue'
import Employee from '../views/Employee.vue'
import Teams from '../views/Teams.vue'
import Settings from '../views/Settings.vue'

Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'Dashboard',
    component: Dashboard
  },
  {
    path: '/employee/:id?',
    name: 'Employee',
    component: Employee
  },
  {
    path: '/teams/:id?',
    name: 'Teams',
    component: Teams
  },
  {
    path: '/settings/:id?',
    name: 'Settings',
    component: Settings
  }
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
