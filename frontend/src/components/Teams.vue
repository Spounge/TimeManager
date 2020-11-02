<template>
  <div class="teams tile">
    <CreateTeam
    :isActive="isActive"
    :toggleModal="toggleModal"
    ></CreateTeam>
      <header class="header">
          <h1 class="title">Teams page</h1>
          <div class= "left">
              <select class="search-bar" v-model="team">
                  <option value="0" disabled selected>Select team</option>
                  <option v-for="team in teams" :key="team.message">
                  {{ team.message }}
                  </option>
              </select>
              <button class="button-blue btn-create-team" @click="toggleForm(true)">Create Team</button>
          </div>
      </header>
      <br>
      <div class="container">
          <v-simple-table>
              <thead>
                <tr>
                    <th class="text-left">Username</th>
                    <th class="text-left">Email</th>
                    <th class="text-left">Role</th>
                    <th class="text-left">Active</th>
                </tr>
              </thead>
              <tbody>
                <tr v-for="teamTable in teamTablesData" :key="teamTable.id">
                  <td class="text-tab">{{ teamTable.username }}</td>
                  <td class="text-tab">{{ teamTable.email }}</td>
                  <td class="text-tab">{{ teamTable.role }}</td>
                  <td class="text-tab">{{ teamTable.active }}</td>
                </tr>
              </tbody>
          </v-simple-table>
      </div>
      <footer class="footer">
          <button class="button-blue">Add employee</button>
      </footer>
  </div>
</template>

<script>
import CreateTeam from "../components/Modals/CreateTeam";

export default {
  components: {
    CreateTeam,
  },

  data: () => ({
    isActive: false,

    teamTablesData: [
      { id: 1, username: "John", email: "john.toe@bla.com", role: "Top Manager", active: "°" },
      { id: 2, username: "John", email: "john.toe@bla.com", role: "Top Manager", active: "°" },
      { id: 3, username: "John", email: "john.toe@bla.com", role: "Top Manager", active: "°" },
      { id: 4, username: "John", email: "john.toe@bla.com", role: "Top Manager", active: "°" },
    ],
  
    teams: [
      { message: 'team1' },
      { message: 'team2' },
      { message: 'team3' },
      { message: 'team4' },
    ]
  }),

  methods: {
    toggleModal(show = true) { // ici on creer un parametre pour pouvoir decider de mettre isActive a True ou False celon nos besoin
      this.isActive = show
    }
  },

  
  // methods: {
  //   toggleForm(show = true) {
  //     this.showForm = show;
  //   },
};
</script>

<style lang="scss" scoped>
.teams {
    grid-area: E;
    
  .header {
    display: flex;
    justify-content: space-between;
  }

  .left {
    display: flex;
    justify-content: flex-end;
  }

  .container {
    justify-content: flex-start;
    align-items: flex-start;
    .v-data-table {
      min-width: 100%;
      .text-tab {
        color: black;
      }
    }
  }

  .button-blue {
    &.btn-create-team {
        width: 200px;
    }
    font-size: 16px;
  }

  .text-left{
      font-weight: bold;
      font-size: 14px;
  }

  .search-bar {
    background-color: transparent;
    border: 0;
    border-bottom: 1px solid black;
    border-radius: 0;
    outline: 0;
    width: 60%;
    height: 15px;
    color: black;
    margin-right: 70px;
    margin-top: 22px;
    font-size: 12px;
    }
}
</style>