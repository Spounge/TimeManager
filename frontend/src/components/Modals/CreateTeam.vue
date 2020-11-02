<template>
  <div class="modal-background" 
  :class="{ active: isActive }"
  @click.stop="toggleModal(false)"
  >
      <form 
      class="modal-container tile"
      @submit.prevent="createTeam()"
      @click.stop>
        <header class="header">
          <h2 class="title">Create your Team</h2>
        </header>
        <v-simple-table class="container">
          <thead>
            <tr>
              <th class="header-center">Username</th>
              <th></th>
              <th></th>       
              </tr>
          </thead>
          <tbody>
            <tr v-for="selectEmployee in selectEmployeesData" :key="selectEmployee.id">
              <td>{{ selectEmployee.name }}</td>
              <td></td>
              <td>
              <v-simple-checkbox
                v-model="selectEmployee.select"
                disabled
              ></v-simple-checkbox>
              </td>
            </tr>
          </tbody>
        </v-simple-table>
        <footer class="footer">
          <button type="submit" class="button-green">Create</button>
        </footer>
      </form>
  </div>
</template>

<script>
export default {

  data: () => ({
    selectEmployeesData: [
      {
        id: 1,
        name: "John",
        select: true,
      },
      {
        id: 2,
        name: "John",
        select: false,
      },
      {
        id: 3,
        name: "John",
        select: true,
      },
      {
        id: 4,
        name: "John",
        select: false,
      },
    ],
  }),

  props: {
    isActive: {
      type: Boolean,
      default: false
    },
    toggleModal: {
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
      align-items: center;
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