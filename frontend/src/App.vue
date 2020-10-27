<template>
  <div>
    <Sidebar></Sidebar>
    <router-view></router-view>
  </div>
</template>

<script>
import Sidebar from './components/Sidebar';

export default {
  name: 'App',

  components: {
    Sidebar,
  },

  data: () => ({
    //
  }),
};
</script>
