<template>
  <div class="dashboard">
    <ClockManager></ClockManager>
    <WorkingTime></WorkingTime>
    <WorkingTimes></WorkingTimes>
    <UserChart></UserChart>
  </div>
</template>

<script>
// @ is an alias to /src
import ClockManager from '../components/ClockManager';
import WorkingTime from '../components/WorkingTime';
import WorkingTimes from '../components/WorkingTimes';
import UserChart from '../components/UserChart';

export default {
  name: "Home",
  components: {
    ClockManager,
    WorkingTime,
    WorkingTimes,
    UserChart,
  },
};
</script>

<style lang="scss" scoped>
.dashboard {
  display: grid;
  width: 100%;
  padding: 20px;
  gap: 20px;
  grid-template-rows: repeat(12, 1fr);
  grid-template-columns: repeat(12, 1fr);
  grid-template-areas:
    "A A A A C C C C C C C C"
    "A A A A C C C C C C C C"
    "A A A A C C C C C C C C"
    "B B B B C C C C C C C C"
    "B B B B C C C C C C C C"
    "B B B B C C C C C C C C"
    "D D D D D D D D D D D D"
    "D D D D D D D D D D D D"
    "D D D D D D D D D D D D"
    "D D D D D D D D D D D D"
    "D D D D D D D D D D D D"
    "D D D D D D D D D D D D";
}
</style>
