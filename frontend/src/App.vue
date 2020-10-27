<template>
  <div id="app">
    <Sidebar></Sidebar>
    <router-view/>
  </div>
</template>

<script>
import Sidebar from './components/Sidebar.vue';

export default {
  components: {
    Sidebar
  }
}
</script>

<style lang="scss">
#app {
  height: 100vh;
  display: flex;
  // font-family: Avenir, Helvetica, Arial, sans-serif;
  font-family: Roboto;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}
</style>
