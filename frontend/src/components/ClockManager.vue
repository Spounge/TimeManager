<template>
  <div class="clock-manager tile">
    <header class="header">
      <h3 class="title">Clock Manager</h3>
    </header>
    <div class="container">
      <h2 class="clock-time">00:00:00</h2>
    </div>
    <footer class="footer">
      <button class="button-green">Start Time</button>
    </footer>
  </div>
</template>

<script>
export default {
};
</script>

<style lang="scss" scoped>
.clock-manager {
  display: flex;
  flex-direction: column;
  .header {
    display: flex;
    justify-content: flex-start;
  }
  .container {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100%;
    .clock-time {
      font-size: 44px;
    }
  }
  .footer {
    display: flex;
    justify-content: flex-end;
  }

  grid-area: A;
}
</style>