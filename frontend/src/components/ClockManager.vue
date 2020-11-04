<template>
  <div class="clock-manager tile">
    <header class="header">
      <h3 class="title">Clock Manager</h3>
    </header>
    <div class="container">
      <h2 class="clock-time" v-if="$route.name === 'Dashboard'">
        {{ currentTime }}
      </h2>
      <h2 class="clock-time" v-else>
        00:00:00
      </h2>
    </div>
    <footer class="footer" v-if="$route.name === 'Dashboard'">
      <button
        class="button-green"
        v-if="clock.timerInterval == null"
        @click="startTimer()"
      >
        Start Time
      </button>
      <button
        class="button-red"
        v-else
        @click="stopTimer()"
      >
        Stop Time
      </button>
    </footer>
  </div>
</template>

<script>
import { mapActions, mapGetters, mapState } from "vuex";

export default {
  computed: {
    ...mapState("clock", { clock: (state) => state }),
    ...mapGetters("clock", { currentTime: "currentTime" }),
  },
  methods: {
    ...mapActions("clock", ["startTimer", "stopTimer"]),
  },
};
</script>

<style lang="scss" scoped>
.clock-manager {
  display: flex;
  flex-direction: column;
  .header {
    display: flex;
    justify-content: flex-start;
  }
  .container {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100%;
    .clock-time {
      font-size: 44px;
    }
  }
  .footer {
    display: flex;
    justify-content: flex-end;
  }

  grid-area: A;
}
</style>