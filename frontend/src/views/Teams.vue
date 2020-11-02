<template>
  <div class="teams-page">
    <Teams></Teams>
    <UserChart></UserChart>
  </div>
</template>

<script>
// @ is an alias to /src
import Teams from '../components/Teams';
import UserChart from '../components/UserChart';

export default {
  name: "Home",
  components: {
    Teams,
    UserChart,
  },
};
</script>

<style lang="scss" scoped>
.teams-page {
  display: grid;
  width: 100%;
  padding: 20px;
  gap: 20px;
  // grid-template-rows: min-content;
  // grid-template-columns: min-content;
  grid-template-rows: repeat(12, 1fr);
  grid-template-columns: repeat(12, 1fr);
  grid-template-areas:
    "E E E E E E E E E E E E"
    "E E E E E E E E E E E E"
    "E E E E E E E E E E E E"
    "E E E E E E E E E E E E"
    "E E E E E E E E E E E E"
    "E E E E E E E E E E E E"
    "D D D D D D D D D D D D"
    "D D D D D D D D D D D D"
    "D D D D D D D D D D D D"
    "D D D D D D D D D D D D"
    "D D D D D D D D D D D D"
    "D D D D D D D D D D D D";
}
</style>
