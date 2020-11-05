<template>
  <div class="profile tile">
    <header class="header">
      <h1 class="title">Profile information</h1>
    </header>
    <div class="container">
      <div class="avatar-circle">
        <h2>JD</h2>
      </div>
      <form class="profile-info">
        <label class="fname">Username :</label>
        <v-text-field
          :rules="rules"
          hide-details="auto"
          value="John Doe"
        ></v-text-field>
        <br />
        <label class="fname">Email :</label>
        <v-text-field
          :rules="rules"
          hide-details="auto"
          value="john.doe@mail.com"
        ></v-text-field>
        <br />
        <label class="fname">Password :</label>
        <v-text-field
          :rules="rules"
          hide-details="auto"
          type="password"
          value=""
        ></v-text-field>
        <br />
      </form>
    </div>
    <footer class="footer">
      <button class="button-blue">Update profile</button>
    </footer>
  </div>
</template>

<script>
export default {
  data: () => ({
    rules: [
      (value) => !!value || "Required.",
      (value) => (value && value.length >= 3) || "Min 3 characters",
    ],
  }),
};
</script>

<style lang="scss" scoped>
.profile {
  grid-area: F;

  .container {
    display: flex;
    justify-content: flex-start;
    align-items: flex-start;

    margin: 50px;
  }

  .profile-info {
    display: flex;
    justify-content: space-around;
    flex-direction: column;
    align-items: flex-start;

    margin-left: 100px;

    .fname {
      font-weight: bold;
      margin-top: 30px;
      margin-top: 50px;
    }
  }

  .avatar-circle {
    display: flex;
    justify-content: center;
    align-items: center;

    width: 175px;
    height: 175px;
    border-radius: 100%;
    font-size: 48px;
    background: white;
    border: 5px solid lightgrey;
    color: lightgrey;

    margin-bottom: 20px;
  }
}
</style>