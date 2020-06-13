<template>
  <!--搜索框组件-->
  <div id="seachBox">
    <div style="width: 60%" class="input-group">

      <select v-model="isNew">
        <option value="1">搜新房</option>
        <option value="0">搜二手房</option>
      </select>

      <input type="text" v-model="location" class="form-control" placeholder="请输入搜索的地区" style="width: 50%;height:50px;display: inline"/>
      <button @click="serchHouse" class="btn btn-success btn-lg" style="width: 20%;border-radius: 0px 8px 8px 0px;">搜索</button>
    </div>
  </div>
</template>

<script>
  import 'bootstrap/dist/css/bootstrap.min.css';
  import merge from 'webpack-merge';

  export default {
    name: "searchBox",
    data:function () {
      return {
        isNew: 0  ,
        location:""
      }
    },
    methods:{
      serchHouse:function () {
        if(this.isNew=="0"){
          sessionStorage.setItem("selectMenu",2);
        }else{
          sessionStorage.setItem("selectMenu",1);
        }

        var pattern =/^\s*$/;
        //有效字符
        if(!pattern.test(this.location)){
          this.$router.replace("/list?isNew="+this.isNew+"&location="+this.location);
          this.$router.go(0);
        }else{
          this.$router.replace("/list?isNew="+this.isNew);
          this.$router.go(0);
        }

      }
    },
    mounted:function () {
      var address =  this.$route.query.location;
      if(address){
        this.location = address;
      }
      var isNewNav = parseInt(sessionStorage.getItem("selectMenu"));
      if(isNewNav==2){
        this.isNew= 0;
      }

      if(isNewNav == 1){
        this.isNew = 1;
      }
    },
    watch:{
      location:function (newLocal,oldLocal) {
        this.$router.replace({
          query:merge(this.$route.query,{location:newLocal})
        });
      }
    }
  }
</script>

<style scoped>
  #seachBox {
    display: flex;
    justify-content: center;
    align-items: center;
    padding-top: 3%;
    padding-bottom: 3%;
    margin-top: 7%;
    margin-bottom: 5%;
  }

  select {
    border: 1px solid rgb(206, 212, 218);
    border-radius: 8px 0px 0px 8px;
    width: 12%;
    text-align: center;
    text-align-last: center;
  }

</style>
