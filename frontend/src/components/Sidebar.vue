<template>
  <div class="sidebar">
    <div class="sidebar-header">
      <div class="avatar-circle">
        <h2>JD</h2>
      </div>
      <h4 class="employee-role">Top Manager</h4>
      <h3 class="employee-name">John Doe</h3>
    </div>

    <span class="white-line"></span>

    <div class="sidebar-nav">
      <div v-for="route in routesList" :key="route.name">
        <router-link
          class="router-link"
          :class="{ selected: $route.name == route.name }"
          :to="route.pathTo"
        >
          <img class="logos" :src="route.logo" :alt="route.name" />
          {{ route.name }}
          <span class="triangle"></span>
        </router-link>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "Sidebar",
  data: () => ({
    // * ROUTES LIST
    routesList: [
      {
        name: "Dashboard",
        pathTo: "/",
        logo: require("../assets/dashboard-logo.svg"),
      },
      {
        name: "Employee",
        pathTo: "/employee",
        logo: require("../assets/employee-logo.svg"),
      },
    ],
  }),
  mounted() {
    console.log("mounted -> this.$route", this.$route);
  },
};
</script>

<style lang="scss" scoped>
.sidebar {
  position: relative;
  display: flex;
  flex-direction: column;
  align-items: center;

  height: 100%;
  min-width: 250px;
  color: white;
  background: #066aa7;
}

.sidebar-header {
  display: flex;
  flex-direction: column;
  align-items: center;

  .avatar-circle {
    display: flex;
    justify-content: center;
    align-items: center;

    width: 175px;
    height: 175px;
    border-radius: 100%;
    font-size: 48px;
    background: white;
    border: 5px solid lightgrey;
    color: lightgrey;

    margin-bottom: 20px;
  }
  .employee-role {
    font-weight: lighter;
    font-size: 12px;
    margin-bottom: 12px;
  }
  .employee-name {
    font-weight: bolder;
    font-size: 18px;
  }
  margin: 30px 0;
}

.white-line {
  height: 0.5px;
  width: 200px;
  background: white;
}

.sidebar-nav {
  display: flex;
  flex-direction: column;
  width: 100%;

  .router-link {
    display: flex;
    flex-direction: row;
    justify-content: start;
    align-items: center;
    width: calc(100% - 50px); // 100% - padding
    height: 50px;
    text-decoration: none;
    color: white;
    font-size: 18px;
    font-weight: lighter;
    padding: 0 25px;

    .logos {
      height: 25px;
      width: 25px;
      margin-right: 10px;
    }

    &:hover,
    &.selected {
      font-weight: bold;
      background: rgba(92, 193, 255, 0.3);

      .triangle {
        display: inline-block;
      }
    }
  }
}

.triangle {
  position: absolute;
  right: 0;
  display: none;
  height: 0;
  width: 0;
  border-top: 5px solid transparent;
  border-right: 5px solid white;
  border-bottom: 5px solid transparent;
}
</style>