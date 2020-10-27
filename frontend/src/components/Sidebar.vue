<template>
    <div class="sidebar">
        <div class="sidebar-header">
            <h4>Top Manager</h4>
            <h3>John Doe</h3>
        </div>
        <div class="sidebar-nav">
            <router-link to="/">Dashboard</router-link>
            <router-link to="/employee">Employee</router-link>
            <router-link to="/teams">Teams</router-link>
        </div>
    </div>
</template>

<script>
export default {
    name: "Sidebar",
};
</script>

<style lang="scss" scoped>
.sidebar {
    color: white;
    min-width: 200px;
    background: #066AA7;
}

.sidebar-nav {
    display: flex;
    flex-direction: column;
}

</style>