<template>
  <div
    class="sidebar"
    :class="{ active: (user.user_id) }"
  >
    <SidebarHeader></SidebarHeader>

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
import { mapState } from "vuex";
import SidebarHeader from "./SidebarHeader";

export default {
  name: "Sidebar",
  components: {
    SidebarHeader,
  },
  data: () => ({
    // * ROUTES LIST
    routesList: [
      {
        name: "Dashboard",
        pathTo: "/",
        logo: require("../../assets/dashboard-logo.svg"),
      },
      {
        name: "Employee",
        pathTo: "/employee",
        logo: require("../../assets/employee-logo.svg"),
      },
      {
        name: "Teams",
        pathTo: "/teams",
        logo: require("../../assets/teams-logo.svg"),
      },
      {
        name: "Settings",
        pathTo: "/settings",
        logo: require("../../assets/settings-logo.svg"),
      },
    ],
  }),
  mounted() {
    console.log("mounted -> this.$route", this.$route);
    console.log(this.user);
  },
  computed: {
    ...mapState("user", {
      user: (state) => state,
    }),
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
  color: white;
  background: #066aa7;

  overflow: hidden;
  transition: all 1s ease-in-out;

  min-width: 0;
  max-width: 0;
  &.active {
    min-width: 300px;
    max-width: 300px;
  }
}

.white-line {
  height: 0.5px;
  width: 250px;
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
    height: 50px;
    text-decoration: none;
    color: white;
    font-size: 18px;
    font-weight: 200;
    padding: 0 25px;

    .logos {
      height: 25px;
      width: 25px;
      margin-right: 10px;
    }

    &:hover,
    &.selected {
      font-weight: 400;
      background: rgba(92, 193, 255, 0.3);
    }
    &.selected {
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