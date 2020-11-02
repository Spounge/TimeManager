<template>
  <div class="modal-background" 
  :class="{ active: isActive }"
  @click="toggleModal(false)"
  >
      <div class="modal"
      @click.stop>
        <h1>Ceci est une modal :)</h1>
      </div>
  </div>
</template>

<script>
export default {
  props: {
    isActive: {
      type: Boolean,
      default: false
    },
    formToggler: {
      type: Function,
      default: null
    }
  },
};
</script>

<style lang="scss" scoped>
.modal-background {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    z-index: 100;
    background: rgba(0, 0, 0, 0.5);

    // ICI aulieu de mettre "display: flex", on va mettre "display: none" pour cache la modal par default
    // mais mettre "display: flex" si la classe "active" est aussi presente sur cette element
    display: none;
    &.active {
        display: flex;
    }

    justify-content: center;
    align-items: center;

    .modal {
        width: 50%;
        height: 50%;
        background: white;
    }
}
// .modal-background {
//   display: none;
//   &.active {
//     display: flex;
//   }

//   position: absolute;
//   top: 0;
//   left: 0;

//   justify-content: center;
//   align-items: flex-start;
//   width: 100%;
//   height: 100%;
//   z-index: 100;


//   background: rgba(0, 0, 0, 0.5);

//   .modal-container {
//     position: relative;
//     width: 60%;
//     margin-top: 5%;

//     .modal-form {
//       display: flex;
//       flex-direction: column;
//       align-items: center;

//       padding: 20px;
//       .inputs {
//         display: grid;
//         grid-template-columns: 1fr 2fr;
//         align-items: center;
//         margin: 20px 0;
//         label {
//           justify-self: flex-end;
//           font-weight: 600;
//           padding: 0 10px;
//         }
//         input {
//           justify-self: flex-start;
//           padding: 0 10px;
//         }
//       }
//     }

//     .button-green {
//       color: white;
//     }
//   }
// }
</style>