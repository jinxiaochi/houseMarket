<template>
  <div class="filter">
    <!--过滤区-->
    <div>
      价格区间:(万元)
      <input v-model="priceMin" type="text" class="input" placeholder="最低价格"/>-<input type="text" v-model="priceMax"
                                                                                      class="input" placeholder="最高价格"/>
      &nbsp;&nbsp;&nbsp;&nbsp;
      面积区间:(平方米)
      <input type="text" v-model="areaMin" class="input" placeholder="最小面积"/>-<input v-model="areaMax" type="text"
                                                                                     class="input" placeholder="最大面积"/>
    </div>


    <div class="select">
      户型:<select style="border: 1px solid rgb(206, 212, 218);border-radius: 5px;
         width: 12%;text-align: center;text-align-last: center;" v-model="type">
      <option value="0">所有</option>
      <option value="1">1室</option>
      <option value="2">2室</option>
      <option value="3">3室</option>
      <option value="4">4室</option>
      <option value="5">5室及以上</option>
    </select>
      &nbsp;&nbsp;
      &nbsp;&nbsp;
      <select @change="selectChange" id="price" v-model="order_price"
              style="border: 1px solid rgb(206, 212, 218);border-radius: 5px;width: 12%;text-align: center;text-align-last: center;">
        <option value="10">价格排序: 无</option>
        <option value="11">价格升序</option>
        <option value="12">价格降序</option>
      </select>
      &nbsp;&nbsp;&nbsp;&nbsp;
      <select @change="selectChange" id="area" v-model="order_area"
              style="border: 1px solid rgb(206, 212, 218);border-radius: 5px;width: 12%;text-align: center;text-align-last: center;">
        <option value="20">面积排序: 无</option>
        <option value="21">面积升序</option>
        <option value="22">面积降序</option>
      </select>
      &nbsp;&nbsp;&nbsp;&nbsp;

      <select @change="selectChange" id="type" v-model="order_type"
              style="border: 1px solid rgb(206, 212, 218);border-radius: 5px;width: 12%;text-align: center;text-align-last: center;">
        <option value="30">户型排序:无</option>
        <option value="31">户型升序</option>
        <option value="32">户型降序</option>
      </select>

      <button style="margin-left: 40px; border: 1px darkgray solid;width: 100px;border-radius: 3px;"
              class="btn-success" @click="toFilter">确定
      </button>
    </div>

  </div>
</template>

<script>
  import 'bootstrap/dist/css/bootstrap.min.css';

  export default {
    name: "HourseFilter",
    data: function () {
      return {
        priceMax: null,
        priceMin: null,
        areaMax: null,
        areaMin: null,
        type: 0,
        order: 0,
        order_price: 10,
        order_area: 20,
        order_type: 30
      }
    },
    methods: {
      //改变order的唯一值
      selectChange: function () {
        var selectId = event.target.id;
        switch (selectId) {
          case "price": {
            this.order_area = 20;
            this.order_type = 30;
            this.order = this.order_price;
          }
            break;
          case "area": {
            this.order_price = 10;
            this.order_type = 30;
            this.order = this.order_area;
          }
            break;
          case "type": {
            this.order_price = 10;
            this.order_area = 20;
            this.order = this.order_type;
          }
            break;
          default: {
          }
            break;
        }
      },
      //向父组件发送数据
      toFilter: function () {
        var filter = {};
        filter.priceMax = this.priceMax;
        filter.priceMin = this.priceMin;
        filter.areaMax = this.areaMax;
        filter.areaMin = this.areaMin;
        filter.type = this.type;
        filter.order = this.order;
        //向上级冒泡
        this.$emit("tofilter", filter);
      }
    }
  }
</script>

<style scoped>
  .filter {
    display: flex;
    align-items: center;
    justify-content: space-between;
    flex-direction: column;
  }

  div input {
    margin-top: 3%;
  }

  .select {
    width: 70%;
    margin-top: 2%;
    display: inline;
    margin-left: 400px;
    /*display: flex;*/
    /*justify-content: space-between;*/
  }

  .input {
    border: 1px solid rgb(206, 212, 218);
    border-radius: 5px;
  }
</style>
