<template>
  <div>
    <div style="display: flex;margin-top: 5%;width: 90%;margin-left: 5%;">
      <div>
        <img :src="house.imgUrls" ref="img" class="img-thumbnail img-rounded" width="400px"/>
      </div>

      <div>
        <!--房屋信息区-->
        <table class="table table-striped">
          <caption>房屋详细信息</caption>
          <thead>
          <tr>
            <th>地址</th>
            <th>价格</th>
            <th>面积</th>
            <th>类别</th>
            <th>户型</th>
            <th>热度</th>
          </tr>
          </thead>
          <tbody>
          <tr>
            <td>{{house.location}}</td>
            <td>{{house.price}}万</td>
            <td>{{house.area}}平方米</td>
            <td v-if="house.isNew">新房</td>
            <td v-else>二手房</td>
            <td>{{house.type}}室</td>
            <td>{{house.hot}}</td>
          </tr>

          </tbody>
        </table>
        <p>户主介绍:</p>
        <textarea style="border-radius: 5px;" readonly="readonly" rows="5" cols="70"
        >{{house.recommend}}</textarea>
      </div>

      <div class="btnArea">
        <!--用户操作区;联系看房,点击后 会模拟发送短信给户主(提示成功,后面不管了)-->
        <button class="btn  btn-info btn-lg" @click="buyHouse">联系看房</button>
        <button class="btn btn-default btn-lg" @click="goBack"
                style="border:1px solid">看看别的
        </button>
      </div>

    </div>

  </div>
</template>

<script>
  import 'bootstrap/dist/css/bootstrap.min.css';

  export default {
    name: "HouseDetail",
    methods: {
      goBack: function () {
        var preform = sessionStorage.getItem("preform");
        if(preform){
          this.$router.push(preform)
        }else{
          this.$router.replace("/index");
        }
      },
      buyHouse(){
        var name = sessionStorage.getItem("name");
        if(name){
          alert("我们已通知户主您看房请求,请近期查收你的消息或电话!")
        }else{
          sessionStorage.setItem("preform",window.location.pathname+window.location.search);
          this.$router.replace("/login");

        }
      }
    },
    data: function () {
      return {
        house:{}
      }
    },
    mounted: function () {
      //获得get参数 houseId
      var query = window.location.search.substring(1);
      var houseId = parseInt(query.split("=")[1]);

      //发送ajax请求
      this.$http.post("getHouseDetail", {houseId: houseId}
      ).then(function (res) {
        this.house= res.body;
        // this.house.imgUrls = "http://localhost:8000/imgs/"+this.house.imgUrls;
        this.house.imgUrls = "/imgs/"+this.house.imgUrls;
      }, function (err) {
        console.error(err);
      });



    }
  }
</script>

<style scoped>
  .btnArea {
    display: flex;
    width: 20%;
    margin-right: 0px;
    flex-direction: column;
    justify-content: center;
    align-items: center;
  }

  button {
    margin-top: 60%;
  }
</style>
