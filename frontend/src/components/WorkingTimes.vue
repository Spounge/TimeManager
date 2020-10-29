<template>
  <div class="working-times tile">
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
          </tr>
        </thead>
        <tbody>
          <tr v-for="workingTime in workingTimesData" :key="workingTime.id">
            <td>{{ workingTime.start }}</td>
            <td>{{ workingTime.end }}</td>
            <td>{{ workingTime.duration }}</td>
          </tr>
        </tbody>
      </v-simple-table>
    </div>
    <footer class="footer">
      <button class="button-blue">Add Working Time</button>
    </footer>
  </div>
</template>

<script>
export default {
  data: () => ({
    workingTimesData: [
      { id: 1, start: '21/10/2020 08:30', end: '21/10/2020 18:30', duration: '00:10:00' },
      { id: 2, start: '21/10/2020 08:30', end: '21/10/2020 18:30', duration: '00:10:00' },
      { id: 3, start: '21/10/2020 08:30', end: '21/10/2020 18:30', duration: '00:10:00' },
      { id: 4, start: '21/10/2020 08:30', end: '21/10/2020 18:30', duration: '00:10:00' },
    ]
  }),
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