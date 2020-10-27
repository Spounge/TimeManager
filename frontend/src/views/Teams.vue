<template>
  <div class="teams_page">
    <div class="teams">
      <h1 class="title">Teams page</h1>
      <select v-model="employee">
        <option disabled value="">Select employee</option>
        <option v-for="employee in employees" :key="employee.message">
          {{ employee.message }}
        </option>
      </select>
      <button class="button">Create Team</button>

      <v-data-table
        :headers="headers"
        :items="team_list"
        :items-per-page="5"
        class="elevation-1"
      >
      </v-data-table>

      <button class="button">Add employee</button>
    </div>
    <br />
    <div class="charts">
      <h1>graph</h1>
    </div>
  </div>
</template>

<script>
export default {
  data: function () {
    return (
      {
        employee: null,
        employees: [
          { message: "John" },
          { message: "Marie" },
          { message: "Robert" },
          { message: "Alie" },
        ],
        headers: [
          {
            text: "Username",
            align: "start",
            sortable: false,
            value: "name",
          },
          { text: "Email" },
          { text: "Role" },
          { text: "Active" },
        ],
        team_list: [
          {
            username: "John",
            email: "john@blabla.com",
            role: "Employee",
            active: " ",
          },
        ],
      }
    );
  },
};
</script>

<style lang="scss" scoped>
* {
  font-family: Avenir, Helvetica, Arial, sans-serif;
}

.teams_page {
  width: 100%;
}

.teams {
  box-sizing: border-box;
  width: calc(100% - 40px);
  border-radius: 5px;
  background: #ffffff;
  padding: 12px;
  box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.15);
  min-height: 55vh;
  padding: 30px;
  margin: 20px;
}

.charts {
  box-sizing: border-box;
  width: calc(100% - 40px);
  border-radius: 5px;
  background: #ffffff;
  padding: 12px;
  box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.15);
  min-height: 38vh;
  padding: 30px;
  margin: 20px;
  margin-top: -20px;
}

.button {
  width: 120px;
  font-size: 14px;
  background-color: #066aa7;
  border: 1px solid #066aa7;
  box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.15);
  transition-duration: 0.4s;
  color: white;
  border-radius: 4px;
  padding: 6px 7px;
  // display: flex;
  // flex-direction: column-reverse;
  // text-align: center;
}

.button:hover {
  box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.3);
  opacity: 0.9;
}

// .title {

// }
</style>