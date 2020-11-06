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

    <form class="login tile" @submit.prevent="signin()">
      <header class="header">
        <h3 class="title">Sign In</h3>
      </header>
      <div class="login-form">
        <div class="input-container">
          <label class="label" for="username">first_name :</label>
          <input
            class="input"
            id="username"
            type="text"
            placeholder="Insert first_name"
            v-model="signinForm.first_name"
          />
        </div>
        <div class="input-container">
          <label class="label" for="username">last_name :</label>
          <input
            class="input"
            id="username"
            type="text"
            placeholder="Insert last_name"
            v-model="signinForm.last_name"
          />
        </div>
        <div class="input-container">
          <label class="label" for="username">Username :</label>
          <input
            class="input"
            id="username"
            type="text"
            placeholder="Insert username"
            v-model="signinForm.username"
          />
        </div>
        <div class="input-container">
          <label class="label" for="username">email :</label>
          <input
            class="input"
            id="username"
            type="text"
            placeholder="Insert email"
            v-model="signinForm.email"
          />
        </div>

        <div class="input-container">
          <label class="label" for="password">Password :</label>
          <input
            class="input"
            id="password"
            type="password"
            placeholder="Insert password"
            v-model="signinForm.password"
          />
        </div>

        <div class="input-container">
          <label class="label" for="password">role :</label>
          <input
            class="input"
            id="password"
            type="password"
            placeholder="Insert role"
            v-model="signinForm.role"
          />
        </div>
      </div>
      <footer class="footer">
        <button type="submit" class="button-green">Signin</button>
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
    signinForm: {
      first_name: "",
      last_name: "",
      email: "",
      username: "",
      password: "",
      role: 1,
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

    signin() {
      fetch('http://localhost:4000/api/users', {
        method: 'POST',
        headers: {
          "Content-Type": "application/json"
        },
        body: JSON.stringify({
          user: {
            first_name: this.signinForm.first_name,
            last_name: this.signinForm.last_name,
            username: this.signinForm.username,
            password: this.signinForm.password,
            email: this.signinForm.email,
            role_id: this.signinForm.role,
          }
        })
      })
        .then(response => response.json())
        .then(json => {
          console.log("JSON", json);
        })
    }

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