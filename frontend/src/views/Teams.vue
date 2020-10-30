<template>
  <div class="teams-page">
    <Teams></Teams>
    <Chart></Chart>
  </div>
</template>

<script>
// @ is an alias to /src
import Teams from '../components/Teams';
import Chart from '../components/Chart';

export default {
  name: "Home",
  components: {
    Teams,
    Chart
  },
};
</script>

<style lang="scss" scoped>
.teams-page {
  display: grid;
  width: 100%;
  padding: 20px;
  gap: 20px;
  grid-template-rows: max-content;
  grid-template-columns: max-content;
  grid-template-areas:
    "E E E E E E E E E E E E"
    "E E E E E E E E E E E E"
    "D D D D D D D D D D D D";
}
</style>
