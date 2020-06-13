<template>
  <div>
    <SearchBox></SearchBox>
    <br/>
    <hr/>

    <HourseFilter @tofilter="filteData"></HourseFilter>

    <!--过滤区-->
    <br/>
    <hr/>

    <!--数据展示区-->
    <div class="listArea" v-for="item in dataList">
      <ListItem :key="item.oddNum.key" :houseId="item.oddNum.houseId" :imgUrls="item.oddNum.imgUrls"
                :price="item.oddNum.price" :area="item.oddNum.area" :type="item.oddNum.type"
                :location="item.oddNum.location" :hot="item.oddNum.hot"/>
      <ListItem :key="item.eventNum.key" :houseId="item.eventNum.houseId" :imgUrls="item.eventNum.imgUrls"
                :price="item.eventNum.price" :area="item.eventNum.area" :type="item.eventNum.type"
                :location="item.eventNum.location" :hot="item.eventNum.hot" v-if="!item.eventNum.hidden" />
    </div>

    <!--分页区-->
    <hr style="margin-top: 5%;"/>
    <div style="display: flex;justify-content: center;margin-top: 3%;">
      <ul class="pagination">
        <li v-show="lastPage" @click="lastPgae">
          <div class="disactive"><a class="disactive">&laquo;</a></div>
        </li>
        <li v-for="item in pageArr" :key="item.data" @click="toNumPage(item.data)">
          <div :class="item.class"><a  :class="item.class">{{item.data}}</a></div>
        </li>

        <li v-show="nextpage" @click="nextPage">
          <div class="disactive"><a  class="disactive">&raquo;</a></div>
        </li>
      </ul>
    </div>
  </div>
</template>

<script>
  import SearchBox from "./searchBox";
  import ListItem from "./ListIteam";
  import HourseFilter from "./HourseFilter";
  import 'bootstrap/dist/css/bootstrap.min.css';
  import merge from 'webpack-merge';

  export default {
    name: "HourseList",
    inject:["reload"],
    data: function () {
      return {
        pageArr: [],
        lastPage: true,
        nextpage: true,
        dataList: [],
        filterHouse:null,

      }
    },
    methods: {
      //过滤,下一步会进入mounted
      filteData(data){
        var isNew = this.$route.query.isNew;
        var page = 1;
        var location = this.$route.query.location;
        if(!location){
          location="";
        }

        // window.location.search="?isNew=" + isNew + "&page=" + page+"&location="+location;
        for(var key in data){
          if(!data[key]){
            data[key]=null;
          }
        }
        this.filterHouse = data;
        this.updatePagation(isNew, page,location,this.filterHouse);
        this.updatePageData(isNew, page,location,this.filterHouse);

      },
      //上一页
      lastPgae: function () {
        var page = parseInt(this.$route.query.page);
        var isNew = this.$route.query.isNew;
        var location = this.$route.query.location;
        if(!location){
          location="";
        }
        if (page) {
          if (page > 1) {
            page--;
            //这个不会引起页面重新加载
            this.$router.replace({
              query:merge(this.$route.query,{page:page})
            });
            // window.location.search="?isNew=" + isNew + "&page=" + page+"&location="+location;
            this.changeSelectPage(page);
            this.updatePageData(isNew, page,location,this.filterHouse);
          }
        }
      },
      //下一页
      nextPage: function () {
        var page = parseInt(this.$route.query.page);
        var isNew = this.$route.query.isNew;
        var location = this.$route.query.location;
        if(!location){
          location="";
        }
        if (!page) {
          page = 1;
        }
        if (page < this.pageArr.length) {
          page++;
          this.$router.replace({
            query:merge(this.$route.query,{page:page})
          });
          this.changeSelectPage(page);
          this.updatePageData(isNew, page,location,this.filterHouse);
        }

      },
      //跳转特定页码
      toNumPage: function (num) {
        var isNew = this.$route.query.isNew;
        var location = this.$route.query.location;
        if(!location){
          location="";
        }
        this.$router.replace({
          query:merge(this.$route.query,{page:num})
        });
        this.changeSelectPage(num);
        this.updatePageData(isNew, num,location,this.filterHouse);
      },
      //改变被选中的页码
      changeSelectPage:function(activePage){
        for(var i = 0;i<this.pageArr.length;i++){
          if(this.pageArr[i].data == activePage){
            this.pageArr[i].class="active";
          }else{
            this.pageArr[i].class="disactive";
          }
        }
      },
      //1 建立分页
      updatePagation: function (isNew,activePage, location, filterHouse ) {
        if(!filterHouse){
          filterHouse={
            priceMax:-1,
            priceMin:-1,
            areaMax:-1,
            areaMin:-1,
            type:0
          };
        }
        if(!location){
          location = null;
        }
        this.$http.post("getHouseCount", {
          isNew: isNew,location:location,
          priceMax:filterHouse.priceMax,priceMin:filterHouse.priceMin,
          areaMax:filterHouse.areaMax,areaMin:filterHouse.areaMin,
          type:filterHouse.type
        }).then(function (res) {
          this.pageArr=[];
          var pages = Math.ceil(res.body / 6);
          if (pages == 1) {
            this.lastPage = false;
            this.nextpage = false;
          }
          for (var i = 1; i <= pages; i++) {
            var item = {};

            item.data = i;
            if (i == activePage) {
              item.class = "active";
            } else {
              item.class = "disactive";
            }
            this.pageArr.push(item);

          }
        }, function (err) {
          alert(err)
        })
      },
      //2 导入第page页的数据
      updatePageData: function (isNew, page, location, filterHouse) {

        if(!filterHouse){
          filterHouse={
            priceMax:-1,
            priceMin:-1,
            areaMax:-1,
            areaMin:-1,
            type:0,
            order:null
          };
        }
        if(!location){
          location = null;
        }
        this.$http.post("getHouseList", {
          page: page, isNew: isNew,location:location,
          priceMax:filterHouse.priceMax,priceMin:filterHouse.priceMin,
          areaMax:filterHouse.areaMax,areaMin:filterHouse.areaMin,
          type:filterHouse.type, order:filterHouse.order
        }).then(
          function (res) {
            this.dataList=[];
            var data = res.body;
            if(data.length%2==0){
              for (var i = 0; i < data.length; i += 2) {
                data[i].key = i + 1;
                data[i + 1].key = i + 2;
                // data[i].imgUrls = "http://localhost:8000/imgs/" + data[i].imgUrls;
                data[i].imgUrls = "/imgs/" + data[i].imgUrls;
                // data[i + 1].imgUrls = "http://localhost:8000/imgs/" + data[i + 1].imgUrls;
                data[i + 1].imgUrls = "/imgs/" + data[i + 1].imgUrls;
                var item = {};
                item.oddNum = data[i];
                item.eventNum = data[i + 1];
                this.dataList.push(item);
              }
            }else{
              for (var i = 0; i < data.length-1; i += 2) {
                data[i].key = i + 1;
                data[i + 1].key = i + 2;
                // data[i].imgUrls = "http://localhost:8000/imgs/" + data[i].imgUrls;
                data[i].imgUrls = "/imgs/" + data[i].imgUrls;
                // data[i + 1].imgUrls = "http://localhost:8000/imgs/" + data[i + 1].imgUrls;
                data[i + 1].imgUrls = "/imgs/" + data[i + 1].imgUrls;
                var item = {};
                item.oddNum = data[i];
                item.eventNum = data[i + 1];
                this.dataList.push(item);
              }

              var lastOne = {
                oddNum:{},
                eventNum:{}
              };
              lastOne.oddNum = data[data.length-1];
              lastOne.oddNum.key = data.length;
              // lastOne.oddNum.imgUrls = "http://localhost:8000/imgs/" +lastOne.oddNum.imgUrls;
              lastOne.oddNum.imgUrls = "/imgs/" +lastOne.oddNum.imgUrls;
              lastOne.eventNum.key = data.length+1;
              lastOne.eventNum.hidden="true";
              this.dataList.push(lastOne);
              console.log(lastOne);
            }

            //若data得到的是奇数个元素,则会有最后一个丢失的情况;解决此bug

          },
          function (err) {
            console.error(err);
          }
        )
      }
    },
    components: {
      SearchBox,
      ListItem,
      HourseFilter
    },
    created: function () {
      var isNew = this.$route.query.isNew;
      var page = this.$route.query.page;
      var location = this.$route.query.location;
      if(!location){
        location="";
      }

      if(!page){
        page = 1;
      }
      // console.log(22)
      this.updatePagation(isNew, page,location);
      this.updatePageData(isNew, page,location);

    },
    watch:{


    }

  }


</script>

<style scoped>
  .listArea {
    margin-top: 5%;
    display: flex;
  }

  li {
    border: 1px darkgray solid;
    border-radius: 6px;
    font-size: 20px;
    cursor: pointer;
  }

  li div {
    display: flex;
    width: 50px;
    height: 50px;
    justify-content: center;
    align-items: center;
  }

  .active {
    background-color: rgb(57, 64, 67);
    color: white;
    border-radius: 5px;
  }

  .disactive {
    background: white;
    color: rgb(85, 85, 85);
    border-radius: 5px;
  }

  a {
    text-decoration: none;
    color: white;
  }
</style>
