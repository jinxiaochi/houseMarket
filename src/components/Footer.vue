<template>
  <footer >
    <div id="footer">
      <span>淘房网(武汉)科技有限公司</span>
      <span> © Copyright©2020-2030 &nbsp;&nbsp;淘房网taofang.com版权所有</span>
      <span>客服热线:010-9966</span>
    </div>
  </footer>
</template>

<script>
  export default {
    name: "Footer"
  }
</script>

<style scoped>
  #footer{
    width: 100%;
    margin-top: 3%;
    /*margin-bottom: 0px;*/
    background-color: #8a8a8a;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    color: white;

  }

  span{
    color: white;
  }

</style>
