<template>
  <div class="sidebar-header-container">
    <div class="sidebar-header" v-if="this.$route.name !== 'Employee'">
      <div class="avatar-circle">
        <h2>JD</h2>
      </div>
      <h4 class="employee-role">{{ user.role }}</h4>
      <h3 class="employee-name">{{ userFullname }}</h3>
    </div>
    <div class="sidebar-header" v-else>
      <div class="select-container">
        <v-select
          v-model="selectedRole"
          :items="roles"
          item-text="label"
          item-value="value"
          label="Select a role"
        ></v-select>
        <v-select
          v-model="selectedEmployee"
          :items="employees"
          item-text="label"
          item-value="value"
          label="Select an employee"
        ></v-select>
      </div>
      <div class="avatar-circle employee">
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
  data: () => ({
    roles: [
      { value: 1, label: "Employee" },
      { value: 2, label: "Manager" },
      { value: 3, label: "Top Manager" },
    ],
    selectedRole: null,

    employees: [
      { value: 1, label: "John Doe" },
      { value: 2, label: "Someone Else" },
      { value: 3, label: "Quelqun Dautre" },
    ],
    selectedEmployee: null,
  }),
  computed: {
    ...mapState("user", { user: (state) => state }),
    ...mapState("employee", { employee: (state) => state }),
    ...mapGetters("user", { userFullname: "fullname" }),
    ...mapGetters("employee", { employeeFullname: "fullname" }),
  },
};
</script>

<style lang="scss">
.sidebar-header-container, .sidebar-header {
  width: 100%;
  transition: all 1s ease;
}

.sidebar-header {
  display: flex;
  flex-direction: column;
  align-items: center;
  margin: 20px 0;

  .avatar-circle {
    display: flex;
    justify-content: center;
    align-items: center;

    width: 250px;
    height: 250px;
    border-radius: 100%;
    font-size: 48px;
    background: white;
    border: 5px solid lightgrey;
    color: lightgrey;

    margin-bottom: 20px;

    &.employee {
      width: 175px;
      height: 175px;
    }
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

  .select-container {
    width: 100%;
    padding: 0 30px;
    .theme--light.v-label {
      color: white !important
      ;
    }
    .theme--light.v-select .v-select__selection--comma {
      color: rgba(255, 255, 255, 1);
    }
    .theme--light.v-input {
      color: rgba(255, 255, 255, 1);
    }

    // big bottom border
    .theme--light.v-text-field > .v-input__control > .v-input__slot:before {
      border: 1px solid rgba(255, 255, 255, 1);
    }
    .theme--light.v-text-field:hover > .v-input__control > .v-input__slot:before {
      border: 1px solid rgba(255, 255, 255, 1);
    }

    // triangle icon
    .theme--light.v-icon {
      color: rgba(255, 255, 255, 1);
    }

    // label
    .v-text-field .v-label--active {
      max-width: 133%;
      font-size: 12px;
      transform: translateY(-20px) scale(1);
      color: rgba(255, 255, 255, 0.7) !important;
      // left: -18px !important;
    }
  }
}
</style>