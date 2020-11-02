<template>
  <div class="working-times tile">
    <AddWorkingTime
      :isActive="showForm"
      :formToggler="toggleForm"
    ></AddWorkingTime>
    <header class="header">
      <h3 class="title">Working Times</h3>
    </header>
    <div class="container">
      <v-simple-table>
        <thead>
          <tr>
            <th class="header-center">Start</th>
            <th class="header-center">End</th>
            <th class="header-center">Lasted</th>
            <!-- <th class="header-center">Actions</th> -->
          </tr>
        </thead>
        <tbody>
          <tr v-for="workingTime in workingTimesData" :key="workingTime.id">
            <td>{{ workingTime.start }}</td>
            <td>{{ workingTime.end }}</td>
            <td>{{ workingTime.duration }}</td>
            <!-- <td>
              <v-card-actions>
                <v-spacer></v-spacer>
                <v-btn color="blue darken-1" text @click="close">
                  <img class="logos" src="../assets/user-tab-logo.svg" />
                </v-btn>
                <v-btn color="blue darken-1" text @click="save">
                  <img class="logos" src="../assets/pencil-logo.svg" />
                </v-btn>
                <v-btn color="blue darken-1" text @click="save">
                  <img class="logos" src="../assets/trash-simple.svg" />
                </v-btn>
              </v-card-actions>
            </td> -->
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
    ],
  }),
  methods: {
    toggleForm(show = true) {
      this.showForm = show;
    },
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
    justify-content: flex-start;
    align-items: flex-start;
    .v-data-table {
      min-width: 100%;
    }
  }

  .footer {
    .button-blue {
      font-size: 16px;
    }
  }
}
</style>