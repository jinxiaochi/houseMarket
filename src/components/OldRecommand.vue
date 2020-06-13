<template>
  <!--二手房推荐列表-->
  <div>
    <div id="info" name="old">
      <a name="old"><span><b>二手房推荐</b></span></a>
      <a href="/list?isNew=0" @click="setSelectMenu">
        <img src="../assets/more.png" style="display: inline"/>
        <span>更多二手房</span>
      </a>
    </div>

    <div class="imgArea">
      <IndexItem v-for="item in oldHouse" v-bind:url="item.imgUrls" v-bind:key="item.key"
                 :price="item.price" :area="item.area" :location="item.location" :type="item.type"
                 :houseId="item.houseId"
      ></IndexItem>
    </div>

  </div>

</template>

<script>
  import IndexItem from "./IndexItem";
  //二手房推荐区
  export default {
    name: "OldRecommand",
    components: {
      IndexItem
    },
    data: function () {
      return {
        oldHouse: []
      }
    },
    methods: {
      setSelectMenu: function () {
        sessionStorage.setItem("selectMenu", 2);
      }
    },
    mounted: function () {
      this.$http.post("indexOld").then(
        function (res) {
          this.oldHouse = res.body;
          for (var i = 0; i < this.oldHouse.length; i++) {
            this.oldHouse[i].key = i + 1;
            // this.oldHouse[i].imgUrls = "http://localhost:8000/imgs/" + this.oldHouse[i].imgUrls;
            this.oldHouse[i].imgUrls = "/imgs/" + this.oldHouse[i].imgUrls;
          }
        },
        function (err) {
          console.log(err)
        }
      )
    }
  }
</script>

<style scoped>
  #info {
    display: flex;
    justify-content: space-between;
    align-items: flex-start;
    margin-top: 1%;
  }

  .imgArea {
    display: flex;
    justify-content: space-between;
    width: 80%;
    margin: 3% auto auto;

  }

  div a {
    text-decoration: none;

  }
</style>
