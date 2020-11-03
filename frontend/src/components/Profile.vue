<template>
  <div class="profile tile">
    <header class="header">
        <h1 class="title">Profile information</h1>
    </header>
    <form>
        <label for="fname">First name:</label><br>
        <input type="text" id="fname" name="fname" value="John"><br>
        <label for="lname">Last name:</label><br>
        <input type="text" id="lname" name="lname" value="Doe"><br><br>
        <input type="submit" value="Submit">
    </form>
    <footer class="footer">
        <button class="button-blue">Update profile</button>
    </footer>
  </div>
</template>

<script>
  
</script>

<style lang="scss" scoped>
.profile {
    grid-area: F;

}
</style>