<template>
  <!--页首组件-->
  <header>
    <div class="header">
      <a href="/index" @click="changeSelect(0)">
        <div id="img">
          <img src="../assets/logo.png" style="display: inline"/>
        </div>
      </a>
      <a id="label" href="/index" @click="changeSelect(0)"> &nbsp;淘房网</a>


      <ul class="nav nav-pills">
        <li class="li"><a href="/list?isNew=1" ref="newHouse" @click="changeSelect(1)"> 新房</a></li>
        <li><a href="/list?isNew=0" ref="oldHouse" @click="changeSelect(2)">二手房</a></li>
        <li><a :href="publishPath" @click="beforePublish">发布房源</a></li>
      </ul>

      <div class="btnArea">
        <a href="/login" ref="loginBtn" @click="beforeLogin">
          <img src="../assets/login.png"/>
          <span ref="loginName">登录/注册</span>
        </a>
      </div>


      <div class="btnArea" ref="logOutArea">
        <a href="javascript:void(0);" @click="logOut">
          <img src="../assets/logOut.png"/>
          <span>注销</span>
        </a>
      </div>

      <div class="btnArea" style="width: 13%">
        <img src="../assets/phone.png"/>
        <span style="font-size: 13px;color: white;position: static;">热线电话: 010-9966</span>
      </div>
    </div>
  </header>
</template>

<script>
  import 'bootstrap/dist/css/bootstrap.min.css';

  export default {
    name: "Header",
    data: function () {
      return {
        selectMenu: 0,
        publishPath:"/publish"
      }
    },
    methods: {
      changeSelect: function (id) {
        this.selectMenu = id;
        sessionStorage.setItem("selectMenu", id);
      },
      logOut: function () {
        sessionStorage.clear();
        this.$refs.loginName.innerHTML = "登录/注册";
        this.$refs.logOutArea.style.visibility = "hidden";
        this.$refs.loginBtn.href = "/login";
        this.$refs.loginBtn.style.cursor = "pointer";
        this.$router.replace("/index");
        this.changeTitle();

      },
      beforePublish:function () {
        var name =  sessionStorage.getItem("name");
        if(!name){
          this.publishPath="/login";
          sessionStorage.setItem("preform","/publish")
        }
      },
      beforeLogin:function(){
        sessionStorage.setItem("preform",window.location.pathname+window.location.search);
      },
      changeTitle:function(){
        var newHouse = this.$refs.newHouse;
        var oldHouse = this.$refs.oldHouse;
        var menu = parseInt(sessionStorage.getItem("selectMenu"));

        this.selectMenu = menu;
        switch (this.selectMenu) {
          case 1: {
            newHouse.style.color = "white";
            oldHouse.style.color = "darkgray";
          }
            break;

          case 2: {
            newHouse.style.color = "darkgray";
            oldHouse.style.color = "white";
          }
            break;
          default: {
            newHouse.style.color = "darkgray";
            oldHouse.style.color = "darkgray";
          }
            break;
        }

        sessionStorage.setItem("selectMenu", this.selectMenu);
        var name = sessionStorage.getItem("name");
        if (name) {
          //若name为有效值
          if(name.length>4){
            this.$refs.loginName.innerHTML = name.substr(0,4)+"...";
          }else{
            this.$refs.loginName.innerHTML = name;
          }

          this.$refs.logOutArea.style.visibility = "visible";
          this.$refs.loginBtn.href = "javascript:void(0);";
          this.$refs.loginBtn.style.cursor = "text";
        } else {
          this.$refs.logOutArea.style.visibility = "hidden";
        }
      }
    },
    mounted: function () {
      if(window.location.pathname=="/index"){
        sessionStorage.setItem("selectMenu",0);
      }
      this.changeTitle();
    }

  }
</script>

<style scoped>
  .header {
    width: 100%;
    height: 20%;
    display: flex;
    justify-content: space-between;
    align-items: flex-end;
    background-color: rgb(57, 64, 67);
  }

  ul {
    width: 50%;
    display: inline;
  }

  li {
    display: inline;
    height: 100%;
    margin-bottom: 20px;
    margin-left: 10%;
    font-size: 20px;

  }

  li a {
    color: darkgray;
    font-size: 20px;
    text-decoration: none
  }

  .whiteColor {
    color: white;
  }

  .grayColor {
    color: darkgray;
  }

  li a:hover {
    color: white;
  }

  li a:active {
    color: white;
  }

  #label {
    width: 25%;
    font-size: 35px;
    color: white;
    text-decoration: none;
  }

  .btnArea {
    width: 10%;
    display: flex;
    /*flex-direction: column;*/
    /*margin-right: 20%;*/
    justify-content: center;
    align-items: flex-end;
  }

  a > span {
    position: relative;
    top: 8px;
    color: white;
    font-size: 13px;
  }

</style>
