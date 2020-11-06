<template>
  <div class="authentication">
    <form class="login tile" @submit.prevent="login()">
      <header class="header">
        <h3 class="title">Login</h3>
      </header>
      <div class="login-form">
        <div class="input-container">
          <label class="label" for="username">Username :</label>
          <input
            class="input"
            id="username"
            type="text"
            placeholder="Insert username"
            v-model="loginForm.username"
          />
        </div>

        <div class="input-container">
          <label class="label" for="password">Password :</label>
          <input
            class="input"
            id="password"
            type="password"
            placeholder="Insert password"
            v-model="loginForm.password"
          />
        </div>
      </div>
      <footer class="footer">
        <button type="submit" class="button-green">Login</button>
      </footer>
    </form>
  </div>
</template>

<script>
import { apiUrl } from "../config/environment";
import { mapActions } from 'vuex';

export default {
  data: () => ({
    loginForm: {
      username: "",
      password: "",
    },
  }),
  methods: {
    ...mapActions('user', ['setUser']),
    login() {
      console.log(this.loginForm);
      fetch(`${apiUrl}/login`, {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify({
          credentials: {
            ...this.loginForm
          },
        }),
      })
      .then((res) => res.json())
      .then((json) => {
        console.log("login", json);
        this.setUser(json.data);
        this.$router.push({
          name: "Dashboard"
        })
      })
      .catch(e => console.error(e));
    },
  },
};
</script>

<style lang="scss" scoped>
.authentication {
  display: flex;
  justify-content: center;
  align-items: center;
  width: 100%;
  padding: 20px;

  .login {
    width: 70%;
    height: 80%;

    .input-container {
      display: grid;
      grid-template-columns: 1fr 2fr;
      align-items: center;
      margin: 10px 0;
      gap: 10px;

      .label {
        justify-self: flex-end;
      }
      .input {
        justify-self: flex-start;
        padding: 0 10px;
        border-bottom: 1px solid grey;
      }
    }
  }
}
</style>