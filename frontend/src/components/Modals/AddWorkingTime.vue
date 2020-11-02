<template>
  <div
    class="modal-background"
    :class="{ active: isActive }"
    @click.stop="formToggler(false)"
  >
    <form
      class="modal-container tile"
      @submit.prevent="addWorkingTime()"
      @click.stop
    >
      <header class="header">
        <h2 class="title">Add Working Time</h2>
      </header>

      <div class="modal-form">
        <div class="inputs">
          <label for="start-time">Start : </label>
          <input
            type="datetime-local"
            id="start-time"
            v-model="workingTimeData.start"
          />
        </div>
        <div class="inputs">
          <label for="end-time">End : </label>
          <input
            type="datetime-local"
            id="end-time"
            v-model="workingTimeData.end"
          />
        </div>
      </div>

      <footer class="footer">
        <button type="submit" class="button-green">Add Working Time</button>
      </footer>
    </form>
  </div>
</template>

<script>
export default {
  props: {
    isActive: {
      type: Boolean,
      default: false
    },
    formToggler: {
      type: Function,
      default: null
    }
  },
  data: () => ({
    workingTimeData: {
      start: null,
      end: null
    }
  }),
  methods: {
    addWorkingTime() {
      // TODO send to real API
      console.log('send working time', this.workingTimeData);
    }
  }
};
</script>

<style lang="scss" scoped>
.modal-background {
  display: none;
  &.active {
    display: flex;
  }

  position: absolute;
  top: 0;
  left: 0;

  justify-content: center;
  align-items: flex-start;
  width: 100%;
  height: 100%;
  z-index: 100;


  background: rgba(0, 0, 0, 0.5);

  .modal-container {
    position: relative;
    width: 60%;
    margin-top: 5%;

    .modal-form {
      display: flex;
      flex-direction: column;
      align-items: center;

      padding: 20px;
      .inputs {
        display: grid;
        grid-template-columns: 1fr 2fr;
        align-items: center;
        margin: 20px 0;
        & > * {
          cursor: pointer;
        }
        label {
          justify-self: flex-end;
          font-weight: 600;
          padding: 0 10px;
        }
        input {
          justify-self: flex-start;
          padding: 0 10px;
        }
      }
    }

    .button-green {
      color: white;
    }
  }
}
</style>