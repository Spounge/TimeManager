<template>
  <div class="chart tile">
    <div class="header">
      <h3 class="title">Chart</h3>
      <button @click="changeData()">Randomize</button>
    </div>

    <div class="container">
      <div class="chart-container">
        <div class="donut-caption">
          <h4 class="title">Work Time</h4>
          <h4 class="workhour">{{workedTime}} hours</h4>
        </div>
        <DonutChart
          :chartData="donutDataCollection"
          :options="donutOptions"
        ></DonutChart>
      </div>
      <div class="chart-container">
        <BarChart
          :chartData="barDataCollection"
          :options="barOptions"
        ></BarChart>
      </div>
    </div>
  </div>
</template>

<script>
import BarChart from "./Charts/BarChart.js";
import DonutChart from "./Charts/DonutChart.js";

export default {
  components: {
    BarChart,
    DonutChart,
  },
  data: () => ({
    // TODO fetch theses from API
    overtime: 3,
    workedTime: 6,
    weekWorkedHours: [8, 5, 4, 9, 5, 6, 7],
    weekNightShift: [2, 0, 4, 0, 0, 3, 2],

    // * INITIAL BAR DATA
    barDataCollection: {},
    barOptions: {
      responsive: true,
      maintainAspectRatio: false,
      scales: {
        xAxes: [
          {
            stacked: true,
            gridLines: {
              display: false,
            },
          },
        ],
        yAxes: [
          {
            stacked: true,
            ticks: {
              beginAtZero: true,
            },
          },
        ],
      },
    },
    // * INITIAL DONUT DATA
    donutDataCollection: {},
    donutOptions: {
      cutoutPercentage: 60,
      responsive: true,
      maintainAspectRatio: false,
      legend: {
        display: false,
      },
    },
  }),
  mounted() {
    this.fillData();
  },
  methods: {
    fillData() {
      let overtimeDiff = 8 - this.overtime;
      let remainingTime = 8 - this.workedTime;
      this.donutDataCollection = {
        labels: ["Overtime", "Worked Hours", "Remaining Time"],
        datasets: [
          {
            weight: 0.5,
            label: "Overtime",
            data: [this.overtime, overtimeDiff, 0],
            backgroundColor: ["#FFCB00", "#FFFFFF00", "#FFFFFF00"],
          },
          {
            weight: 1,
            data: [0, this.workedTime, remainingTime],
            backgroundColor: ["FFFFFF00", "#00D46E", "#AAAAAA"],
          },
        ],
      };
      this.barDataCollection = {
        labels: ["J-6", "J-5", "J-4", "J-3", "J-2", "J-1", "Today"],
        datasets: [
          {
            label: "Worked Hours",
            backgroundColor: "#00D46E",
            data: this.weekWorkedHours,
          },
          {
            label: "Night Shift",
            backgroundColor: "#066AA7",
            data: this.weekNightShift,
          },
        ],
      };
    },
    changeData() {
      console.log("changing");
      this.weekNightShift = [this.getRandomInt(), this.getRandomInt(), this.getRandomInt(), this.getRandomInt(), this.getRandomInt(), this.getRandomInt(), this.getRandomInt()];
      this.weekWorkedHours = [this.getRandomInt(),this.getRandomInt(),this.getRandomInt(),this.getRandomInt(),this.getRandomInt(),this.getRandomInt(),this.getRandomInt()];
      this.overtime = this.getRandomInt();
      this.workedTime = this.getRandomInt();
    },
    getRandomInt() {
      return Math.floor(Math.random() * (50 - 5 + 1)) + 5;
    },
  },
  watch: {
    weekNightShift: function () {
      this.fillData();
    },
    weekWorkedHours: function () {
      this.fillData();
    },
    overtime: function () {
      this.fillData();
    },
    workedTime: function () {
      this.fillData();
    },
  },
};
</script>

<style lang="scss" scoped>
.chart {
  position: relative;
  grid-area: D;

  .container {
    position: relative;
    display: grid;
    width: 100%;
    gap: 50px;
    grid-template-columns: 4fr 8fr;
    margin: 0;
    justify-items: center;

    .chart-container {
      position: relative;
      width: 100%;
      height: 100%;

      .donut-caption {
        position: absolute;
        left: 50%;
        top: 50%;
        transform: translate(-50%, -50%);
        .title, .workhour {
          font-weight: 600;
          font-size: 28px;
        }
      }
    }
  }

}
</style>