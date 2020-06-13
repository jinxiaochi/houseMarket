<template>
  <div id="publish">
    <h3>发布房源</h3>
    <div class="title">
      <div><span style="height: 30px;">地址:&nbsp;&nbsp;</span></div>
      <input class="input" v-model="address" type="text" placeholder="请输入房源地址"/>
    </div>

    <div class="title">
      <div><span style="height: 30px;">面积:&nbsp;&nbsp;</span></div>
      <input class="input" v-model="area" type="number" placeholder="房源面积(平方米)"/>
    </div>

    <div class="title">
      <div><span style="height: 30px;">价格:&nbsp;&nbsp;</span></div>
      <input class="input" v-model="price" type="number" placeholder="房源价格(万)"/>
    </div>

    <div class="title">
      <div><span style="height: 30px;">图片:&nbsp;&nbsp;</span></div>
      <input class="input" ref="imgFile" type="file" placeholder="上传房源图片"/>
    </div>

    <div class="title">
      <div><span style="height: 30px;">类型:&nbsp;&nbsp;</span></div>
      <select v-model="isNew">
        <option value="0">二手房</option>
        <option value="1">新房</option>
      </select>&nbsp;&nbsp;&nbsp;

      <div><span style="height: 30px;">户型:&nbsp;&nbsp;</span></div>
      <select v-model="type">
        <option value="0">所有</option>
        <option value="1">1室</option>
        <option value="2">2室</option>
        <option value="3">3室</option>
        <option value="4">4室</option>
        <option value="5">5室及以上</option>
      </select>
    </div>

    <div class="title">
      <textarea class="input" v-model="recommend" style="border-radius: 15px;" rows="7" cols="50"
                placeholder="(推荐信息)输入房源的优点"/>
    </div>

    <div style="margin-top: 2%;width: 50%;">
      <button class="button" style="margin-left: 30%" @click="publish">发布</button>
      <button class="button" style="margin-left: 20%" @click="cancel">取消</button>
    </div>
  </div>
</template>

<script>
  export default {
    name: "AddHouse",
    data: function () {
      return {
        address: "",
        area: 0,
        price: 0,
        isNew: 0,
        type: 0,
        recommend: ""
      }
    },
    methods: {
      cancel: function () {
        sessionStorage.setItem("selectMenu", 0);
        this.$router.replace("/index");
      },
      //发布房子
      publish() {
        //数据合理性校验
        if (this.price && this.type && this.address && this.area && this.recommend) {
          //正式发布
          var form = new FormData();
          var img = this.$refs.imgFile.files[0];//获取文件
          if(!img){
            alert("未选择上传图片");
            return;
          }
          form.append("img", img);
          form.append("phone", sessionStorage.getItem("phone"))
          form.append("price", this.price);
          form.append("isNew", this.isNew);
          form.append("type", this.type);
          form.append("location", this.address);
          form.append("recommend", this.recommend);
          form.append("area", this.area);

          this.$http.post("publish",
            form,
            {
              emulateJSON: false
            }
          ).then(function (res) {
            if(res.bodyText == "发布成功"){
              alert("发布成功!");
              this.$router.replace("/index");
            }else{
              alert(res.bodyText);
            }
          }, function (err) {
            console.log(err)
          })
        }else{
          alert("部分必须数据未填写")
        }
      }
    },
    mounted:function () {
      sessionStorage.setItem("preform",undefined);
    }
  }
</script>

<style scoped>
  #publish {
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
    margin-top: 1%;
  }

  .input {
    border: 1px solid rgb(206, 212, 218);
    border-radius: 3px;
  }

  .button {
    border: 1px solid rgb(206, 212, 218);
    border-radius: 4px;
  }

  .title {
    display: flex;
    margin-top: 1%;
  }
</style>
