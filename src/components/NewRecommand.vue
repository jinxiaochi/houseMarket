<template>
  <div>
    <!--新房推荐列表-->
    <div id="info">
      <a  name="new"><span><b>新房推荐</b></span></a>
      <a href="/list?isNew=1" @click="setSelectMenu">
        <img src="../assets/more.png" style="display: inline"/>
        <span>更多新房</span>
      </a>
    </div>

    <div class="imgArea">
      <IndexItem v-for="item in newHouse" v-bind:url="item.imgUrls" v-bind:key="item.key"
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
    name: "NewRecommand",
    components: {
      IndexItem
    },
    data: function () {
      return {
        newHouse:[]
      }
    },
    methods:{
      setSelectMenu:function(){
        sessionStorage.setItem("selectMenu",1);
      }
    },
    mounted:function () {
      this.$http.post("indexNew").then(
        function (res) {
          this.newHouse = res.body;
          for(var i = 0;i<this.newHouse.length;i++){
            this.newHouse[i].key=i+1;
            // this.newHouse[i].imgUrls = "http://localhost:8000/imgs/"+this.newHouse[i].imgUrls;
            this.newHouse[i].imgUrls = "/imgs/"+this.newHouse[i].imgUrls;
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
    text-decoration: none
  }
</style>
