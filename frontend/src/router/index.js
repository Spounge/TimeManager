import Vue from 'vue'
import VueRouter from 'vue-router'

import store from '../store'

import Authentication from '../views/Authentication.vue'
import Dashboard from '../views/Dashboard.vue'
import Employee from '../views/Employee.vue'
import Teams from '../views/Teams.vue'
import Settings from '../views/Settings.vue'

Vue.use(VueRouter)

const routes = [
  {
    path: '/login',
    name: 'Authentication',
    component: Authentication
  },
  {
    path: '/',
    name: 'Dashboard',
    component: Dashboard,
    beforeEnter: requireAuth
  },
  {
    path: '/dashboard',
    name: 'Dashboard',
    component: Dashboard,
    beforeEnter: requireAuth
  },
  {
    path: '/employee/:id?',
    name: 'Employee',
    component: Employee,
    beforeEnter: requireAuth
  },
  {
    path: '/teams/:id?',
    name: 'Teams',
    component: Teams,
    beforeEnter: requireAuth
  },
  {
    path: '/settings/:id?',
    name: 'Settings',
    component: Settings,
    beforeEnter: requireAuth
  }
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

function requireAuth(to, from, next) {
  console.log('STORE', store.state);
  if (store.state.user.user_id != null) {
    console.log('next');
    next();
  } else {
    console.log('not next');
    next({
      name: 'Authentication',
    });
  }
}

export default router
