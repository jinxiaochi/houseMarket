import Vue from 'vue'
import Router from 'vue-router'
import VueReource from 'vue-resource';
import IndexSection from "../components/IndexSection.vue";
import HourseList from "../components/HourseList.vue";
import Header from "../components/Header";
import Login from "../components/Login";
import detail from "../components/HouseDetail";
import AddHouse from "../components/AddHouse";


Vue.use(Router);
Vue.use(VueReource);
// Vue.http.options.root = "http://localhost:8000/";
Vue.http.options.emulateJSON = true;
const originalPush = Router.prototype.push
Router.prototype.push = function push(location) {
  return originalPush.call(this, location).catch(err => err)
}


export default new Router({
  routes: [
    {
      path: "/list", components: {
        HourseList,
        Header
      }
    },
    {
      path: "/index", components: {
        IndexSection,
        Header
      }
    },
    {path: "/login", components: {Login}},
    {path: "/detail", components: {detail, Header}},
    {
      path: "/publish", components: {
        AddHouse
      }
    },
    {
      path:"/**",
      redirect:"/index",
    }

  ],
  mode: "history"
})
