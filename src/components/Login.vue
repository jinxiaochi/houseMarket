<template>
  <div class="con">
    <div style="display: flex;justify-content: center;margin-top: 3%;">
      <button @click="toLogin" class="login" :disabled="isLogin">登录</button>
      <button @click="toRegister" class="register" :disabled="isRegister">注册</button>
    </div>

    <div id="login" v-if="isLogin">
      <div style="margin-top: 10%">
        手机号:
        <div><input class="input" type="text" placeholder="请输入手机号" v-model="phone"/></div>
        密 码:
        <div><input class="input" type="password" placeholder="请输入密码" v-model="passwd"/></div>
      </div>
      <div style="margin-top: 15%">
        <button class="button" @click="loginSys">登录</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <button class="button" @click="cancel">取消</button>
      </div>
    </div>

    <div id="register" v-if="isRegister">
      <div class="title">
        <div><span style="height: 30px;">手机号:&nbsp;&nbsp;</span></div>
        <input class="input" type="text" v-model="regPhone" placeholder="请输入手机号"/>
      </div>

      <div class="title">
        <div><span style="height: 30px;">密&nbsp;&nbsp;&nbsp;&nbsp;码:&nbsp;&nbsp;</span></div>
        <input class="input" type="password" v-model="regPasswd" placeholder="请输入密码"/>
      </div>

      <div class="title">
        <div><span style="height: 30px;">用户名:&nbsp;&nbsp;</span></div>
        <input class="input" type="text" v-model="name" placeholder="请输入用户名"/>
      </div>

      <div class="title">
        <div><span style="height: 30px;">地&nbsp;&nbsp;&nbsp;&nbsp;址:&nbsp;&nbsp;</span></div>
        <input class="input" type="text" v-model="address" placeholder="请输入地址"/>
      </div>

      <div style="margin-top: 10%;width: 100%;">
        <button class="button" style="margin-left: 30%" @click="registerSys">注册</button>
        <button class="button" style="margin-left: 20%" @click="cancel">取消</button>
      </div>
    </div>
  </div>

</template>

<script>
  import 'bootstrap/dist/css/bootstrap.min.css';

  export default {
    name: "Login",
    data: function () {
      return {
        //界面状态
        isLogin: true,
        isRegister: false,
        //登录信息
        phone: "",
        passwd: "",
        //注册信息
        regPhone: "",
        regPasswd: "",
        name: "",
        address: ""
      }
    },
    methods: {
      toLogin: function () {
        this.isLogin = true;
        this.isRegister = false;
      },
      toRegister: function () {
        this.isLogin = false;
        this.isRegister = true;
      },
      cancel: function () {
        sessionStorage.setItem("selectMenu", 0);
        this.$router.replace("/index");
      },
      //登录方法
      loginSys: function () {
        //非空验证
        if (this.phone && this.passwd) {
          //手机号验证
          if (this.phone.length != 11) {
            alert("非法手机号")
            return;
          }

          var pattern = /^\d+$/;
          if (!pattern.test(this.phone)) {
            alert("非法手机号");
            return;
          }

          //登录
          this.$http.post("login", {
            phone: this.phone,
            passwd: this.passwd
          }).then(function (res) {
            var data = res.body;
            if (data.userName != "用户名或密码错误用户") {
              //登录成功
              sessionStorage.setItem("name", data.userName);
              sessionStorage.setItem("phone", this.phone);
              //preform代表上一次操作的路由或url
              var preform = sessionStorage.getItem("preform");
              if(preform){
                this.$router.push(preform)
              }else{
                this.$router.replace("/index");
              }
            } else {
              //登录失败
              alert("登录失败,请检查手机号或密码是否正确!");
            }
          }, function (err) {
            console.log(err);
          })
        } else {
          alert("登录信息不完整");
        }


      },

      registerSys: function () {
        if (this.regPhone && this.regPasswd && this.address && this.name) {
          //注册
          if (this.regPhone.length != 11) {
            alert("非法手机号")
            return;
          }

          var pattern = /^\d+$/;
          if (!pattern.test(this.regPhone)) {
            alert("非法手机号");
            return;
          }

          this.$http.post("register", {
            phone: this.regPhone,
            passwd: this.regPasswd,
            address: this.address,
            name: this.name
          }).then(function (res) {
            //注册
            var result = res.bodyText;
            if (result == "注册成功") {

              //清空数据
              this.regPhone = "";
              this.regPasswd = "";
              this.name = "";
              this.address = "";
              alert("注册成功");
              this.toLogin();
            } else {
              alert(result + "!!!");
            }

          }, function (err) {
            console.log(err);
          })

        } else {
          alert("注册信息缺少");
        }
      }
    }
  }
</script>

<style scoped>
  .con {
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
  }

  #login {
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
  }

  #register {
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
    margin-top: 1%;
  }

  .login {
    border: 1px solid rgb(206, 212, 218);
    border-radius: 5px 0px 0px 5px;
  }

  .register {
    border: 1px solid rgb(206, 212, 218);
    border-radius: 0px 5px 5px 0px;
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
    margin-top: 5%;
  }
</style>
