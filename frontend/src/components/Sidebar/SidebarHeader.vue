<template>
  <div>
    <div class="sidebar-header" v-if="this.$route.name !== 'Employee'">
      <div class="avatar-circle">
        <h2>JD</h2>
      </div>
      <h4 class="employee-role">{{ user.role }}</h4>
      <h3 class="employee-name">{{ userFullname }}</h3>
    </div>
    <div class="sidebar-header" v-else>
      <div class="avatar-circle">
        <h2>JD</h2>
      </div>
      <h4 class="employee-role">{{ employee.role || "Employee Role" }}</h4>
      <h3 class="employee-name">{{ employeeFullname || "Employee Name" }}</h3>
    </div>
  </div>
</template>

<script>
import { mapGetters, mapState } from "vuex";

export default {
  computed: {
    ...mapState("user", { user: (state) => state }),
    ...mapState("employee", { employee: (state) => state }),
    ...mapGetters("user", { userFullname: "fullname" }),
    ...mapGetters("employee", { employeeFullname: "fullname" }),
  },
};
</script>

<style lang="scss" scoped>
.sidebar-header {
  display: flex;
  flex-direction: column;
  align-items: center;

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
  .employee-role {
    font-weight: 200;
    font-size: 12px;
    margin-bottom: 12px;
  }
  .employee-name {
    font-weight: bolder;
    font-size: 18px;
  }
  margin: 30px 0;
}
</style>