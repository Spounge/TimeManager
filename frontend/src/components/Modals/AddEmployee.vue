<template>
  <div class="modal-background" 
  :class="{ active: isActive2 }"
  @click.stop="toggleModal2(false)"
  >
      <form 
      class="modal-container tile"
      @submit.prevent="addEmployee()"
      @click.stop>
        <header class="header">
          <h2 class="title">Add employee</h2>
        </header>
        <v-select
        :Employees="Employees"
        v-model="select"
        item-text="name"
        item-value="id"
        return-object
        label="select"
        dense
        ></v-select>
        <footer class="footer">
          <button type="submit" class="button-green">Add</button>
        </footer>
      </form>
  </div>
</template>

<script>
export default {

  data: () => ({

    Employees: [
      {
        id: 1,
        name: "John",
      },
      {
        id: 2,
        name: "John",
      },
      {
        id: 3,
        name: "John",
      },
      {
        id: 4,
        name: "John",
      },
    ],
  }),

  props: {
    isActive2: {
      type: Boolean,
      default: false
    },
    toggleModal2: {
      type: Function,
      default: null
    }
  },
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
    width: 30%;
    margin-top: 5%;

    .modal-form {
      display: flex;
      flex-direction: column;
    //   align-selectEmployee: center;
      padding: 20px;
      }
    }
  
.container{
  justify-content: center;
  .header-center {
    font-weight: bold;
    font-size: 14px;
  }
}
.button-green {
  color: white;
  }
}
</style>