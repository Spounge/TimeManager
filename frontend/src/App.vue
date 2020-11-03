<template>
  <div id="app">
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

<style lang="scss">
#app {
  position: relative;
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
  display: flex;
  flex-direction: column;

  padding: 10px;
  border-radius: 5px;
  background: #FFF;
  box-shadow: 0 2px 10px rgba(0, 0, 0, 0.15);
  .title {
    padding: 10px;
    font-size: 20px;
    font-weight: 600;
  }

  .header {
    display: flex;
    justify-content: flex-start;
  }
  .container {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100%;
  }
  .footer {
    display: flex;
    justify-content: flex-end;
  }
}

.button-green {
  font-size: 16px;
  font-weight: 600;
  padding: 10px 20px;
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

.button-blue {
  font-size: 16px;
  font-weight: 600;
  padding: 10px 20px;
  border-radius: 5px;
  border: none;
  color: white;
  background: #066AA7;
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
