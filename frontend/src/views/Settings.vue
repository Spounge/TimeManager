<template>
  <div class="settings">
    <Profile></Profile>
  </div>
</template>

<script>
// @ is an alias to /src
import Profile from '../components/Profile';

export default {
  name: "Home",
  components: {
    Profile,
  },
};
</script>

<style lang="scss" scoped>
.settings {
  display: grid;
  width: 100%;
  padding: 20px;
  gap: 20px;
  grid-template-rows: repeat(1, 1fr);
  grid-template-columns: repeat(1, 1fr);
  grid-template-areas:
    "F";
}
</style>
