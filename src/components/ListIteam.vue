<template>
    <div class="list" @click="enterDetail" ref="item" v-if="isShow">
        <div><!--图片-->
            <img :src="imgUrls" style="width: 200px;height: 100%"/>
        </div>
        <div class="info"><!--文字-->
            <p>位置:{{location}}</p>
            <span>价格:{{price}}万</span>
            <span>面积:{{area}}平方米</span>
            <span>户型:{{type}}室</span>
            <span><img src="../assets/hot.png"/>&nbsp;:&nbsp;&nbsp;{{hot}}</span>
        </div>

    </div>
</template>

<script>
    export default {
        name: "ListIteam",
        props:["houseId","price","area","type","location","imgUrls","hot"],
        data:function () {
            return {
              isShow: true
            }
        },
      methods:{
        enterDetail:function () {
          //设置上级目录
          sessionStorage.setItem("preform",window.location.pathname+window.location.search);
          this.$router.replace("/detail?houseId="+this.houseId);
        }
      },
      mounted:function () {
        if(!this.houseId){
          this.isShow = false;
        }
      }
    }
</script>

<style scoped>
  .list{
    display: flex;
    width: 30%;
    margin-left: 10%;
    border: 1px solid rgb(206, 212, 218);
    box-shadow: 3px 3px 1px darkgray;
    border-radius: 5px;
    cursor:pointer;
  }

  .info{
    display: flex;
    flex-direction: column;
    justify-content: center;
    margin-left: 3%;
  }
</style>
