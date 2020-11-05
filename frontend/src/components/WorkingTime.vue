<template>
  <div class="working-time tile">
    <header class="header">
      <h3 class="title">Working Time</h3>
    </header>
    <div class="working-time-grid">
      <div class="working-time-content">
        <div class="title-container">
          <h4 class="title">{{todayWorkedHours}}h</h4>
        </div>
        <div class="label-container">
          <h5>(Today)</h5>
          <h5>Working Time</h5>
        </div>
      </div>

      <div class="working-time-content">
        <div class="title-container">
          <h4 class="title">{{weekWorkedHours}}h</h4>
        </div>
        <div class="label-container">
          <h5>(Week)</h5>
          <h5>Working Time</h5>
        </div>
      </div>

      <div class="working-time-content">
        <div class="title-container">
          <h4 class="title">${{weekRevenu}}</h4>
        </div>
        <div class="label-container">
          <h5>(Week)</h5>
          <h5>Revenu</h5>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data: () => ({
    // TODO fetch these from the api
    todayWorkedHours: 9,
    weekWorkedHours: 35,
    weekRevenu: 1250,
  })
};
</script>

<style lang="scss" scoped>
.working-time {
  grid-area: B;

  .working-time-grid {
    display: grid;
    align-content: center;
    justify-items: center;
    grid-template-columns: 6fr 6fr 8fr;
    grid-auto-rows: 100%;

    width: 100%;
    height: calc(100% - 40px);

    .working-time-content {
      display: flex;
      flex-direction: column;
      justify-content: center;
      align-items: center;
      height: 100%;
      width: 100%;
      padding: 20px 0;

      &:last-child .title-container {
        border-right: none;
      }

      .title-container {
        display: flex;
        justify-content: center;
        align-items: center;

        height: 100%;
        width: 100%;
        margin-bottom: 20px;
        border-right: 1px solid black;

        .title {
          font-size: 36px;
        }
      }

      .label-container {
        font-size: 14px;
        font-weight: 600;
        h5 {
          margin-bottom: 4px;
        }
      }
    }
  }
}
</style>