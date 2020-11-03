<template>
  <div class="working-times tile" ref="workingTimesDiv">
    <AddWorkingTime
      :isActive="showForm"
      :formToggler="toggleForm"
    ></AddWorkingTime>
    <header class="header">
      <h3 class="title">Working Times</h3>
    </header>
    <div class="container">
      <v-simple-table
        class="table"
        fixed-header
        :height="tableHeight"
      >
        <thead class="table-header">
          <tr class="table-h-row">
            <th class="header-center">Start</th>
            <th class="header-center">End</th>
            <th class="header-center">Lasted</th>
            <th class="header-center">Actions</th>
          </tr>
        </thead>
        <tbody class="table-body">
          <tr
            class="table-b-row"
            v-for="workingTime in workingTimesData"
            :key="workingTime.id"
          >
            <td>{{ workingTime.start }}</td>
            <td>{{ workingTime.end }}</td>
            <td>{{ workingTime.duration }}</td>
            <td>
              <v-card-actions>
                <v-spacer></v-spacer>
                <v-btn color="blue darken-1" text @click="edit()">
                  <img class="logos" src="../assets/pencil-logo.svg" />
                </v-btn>
                <v-btn color="blue darken-1" text @click="remove()">
                  <img class="logos" src="../assets/trash-simple.svg" />
                </v-btn>
              </v-card-actions>
            </td>
          </tr>
        </tbody>
      </v-simple-table>
    </div>
    <footer class="footer">
      <button class="button-blue" @click="toggleForm(true)">
        Add Working Time
      </button>
    </footer>
  </div>
</template>

<script>
import AddWorkingTime from "../components/Modals/AddWorkingTime";

export default {
  components: {
    AddWorkingTime,
  },
  data: () => ({
    showForm: false,

    workingTimesData: [
      {
        id: 1,
        start: "21/10/2020 08:30",
        end: "21/10/2020 18:30",
        duration: "00:10:00",
      },
      {
        id: 2,
        start: "21/10/2020 08:30",
        end: "21/10/2020 18:30",
        duration: "00:10:00",
      },
      {
        id: 3,
        start: "21/10/2020 08:30",
        end: "21/10/2020 18:30",
        duration: "00:10:00",
      },
      {
        id: 4,
        start: "21/10/2020 08:30",
        end: "21/10/2020 18:30",
        duration: "00:10:00",
      },
      {
        id: 5,
        start: "21/10/2020 08:30",
        end: "21/10/2020 18:30",
        duration: "00:10:00",
      },
      {
        id: 6,
        start: "21/10/2020 08:30",
        end: "21/10/2020 18:30",
        duration: "00:10:00",
      },
      {
        id: 7,
        start: "21/10/2020 08:30",
        end: "21/10/2020 18:30",
        duration: "00:10:00",
      },
    ],

    tableHeight: null,
  }),
  mounted() {
    this.tableHeight = `${this.$refs.workingTimesDiv.clientHeight - 120}px`;
  },
  methods: {
    toggleForm(show = true) {
      this.showForm = show;
    },
    save() {

    },
    edit() {

    },
    delete() {

    }
  },
};
</script>

<style lang="scss" scoped>
.working-times {
  grid-area: C;

  .header {
    display: flex;
  }

  .container {
    position: relative;
    justify-content: flex-start;
    align-items: flex-start;
    // height: calc(100% - 80px);
    // overflow-y: scroll;
    .v-data-table {
      min-width: 100%;

      .table-body .table-b-row {
        padding: 0 !important;
      }
    }
  }

  .footer {
    .button-blue {
      font-size: 16px;
    }
  }
}
</style>