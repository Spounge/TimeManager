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
                <v-btn color="blue darken-1" text @click="remove(workingTime.id)">
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
import { mapState } from 'vuex';
import { secondToHHMMSS } from '../utils/timeConverter';
import { apiUrl } from '../config/environment';

import AddWorkingTime from "../components/Modals/AddWorkingTime";

export default {
  components: {
    AddWorkingTime,
  },
  mounted() {
    this.tableHeight = `${this.$refs.workingTimesDiv.clientHeight - 120}px`;
    this.fetchWorkingTimes();
    console.log(this.timerInterval);
  },
  data: () => ({
    showForm: false,
    workingTimesData: [],
    tableHeight: null,
    refreshTimeout: null,
  }),
  computed: {
    ...mapState('user', { user: state => state }),
    ...mapState('clock', ['timerInterval']),
  },
  methods: {
    fetchWorkingTimes() {
      fetch(`${apiUrl}/working_times_by_user/${this.user.user_id}`)
      .then(res => res.json())
      .then(json => {
        console.log('wk', json);
        let newData = json.data.map((workingTime) => {
          return {
            ...workingTime,
            duration: secondToHHMMSS((
              Date.parse(workingTime.end) - Date.parse(workingTime.start)
            ) / 1000)
          }
        });
        this.workingTimesData = [...newData];
        this.$forceUpdate();
      });
    },
    toggleForm(show = true) {
      this.showForm = show;
    },
    save() {

    },
    edit() {

    },
    remove(id) {
      console.log(id);
      fetch(`${apiUrl}/working_times/${id}`, {
        method: 'DELETE',
        headers: {
          "Content-Type": "application/json",
        }
      }).then(() => this.refreshWorkintTimes(0))
        .catch(e => console.error(e));
    },
    refreshWorkintTimes(ms) {
      this.refreshTimeout = setTimeout(() => {
        this.fetchWorkingTimes();
        clearTimeout(this.refreshTimeout);
      }, ms);
    }
  },
  watch: {
    timerInterval() {
      this.refreshWorkintTimes(50);
    },
  }
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