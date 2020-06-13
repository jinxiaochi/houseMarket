<template>
    <div id="item" @click="enterDetail">
      <img v-bind:src="url" width="100%" />
      <div>
        <!--信息介绍区-->
        <p>{{location}}</p>
        <span>{{price}}万</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <span>{{area}}平方米</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <span>{{type}}室</span><br/>

      </div>
    </div>
</template>

<script>
    export default {
        name: "IndexItem",
        props:["url","price","location","area","type","houseId"],
        methods:{
          enterDetail:function () {
            //设置上级为 /index
            sessionStorage.setItem("preform",window.location.pathname);
            this.$router.replace("/detail?houseId="+this.houseId);
          }
        }
    }
</script>

<style scoped>
    #item{
      width: 30%;
      border-radius: 5px;
      border: 1px solid rgb(206, 212, 218);
      box-shadow: 3px 3px 1px darkgray;
      cursor:pointer;
    }

  div p{
    margin-bottom: 0px;
  }
</style>
