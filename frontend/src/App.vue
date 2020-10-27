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

.tile {
  padding: 10px;
  border-radius: 5px;
  box-shadow: 0 2px 10px rgba(0, 0, 0, 0.15);

  .title {
    padding: 10px;
    font-size: 20px;
    font-weight: 600;
  }
}

.button-green {
  padding: 10px 20px;
  font-size: 18px;
  font-weight: 600;
  border-radius: 5px;
  border: none;
  color: white;
  background: #00D46E;
  box-shadow: 0 2px 10px rgba(0, 0, 0, 0.15);
  cursor: pointer;

  &:hover {
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);
    transform: scale(1.01);
  }
  &:focus {
    outline: none;
  }
}

</style>
