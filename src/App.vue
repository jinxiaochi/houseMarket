<template>
  <div id="app">
    <router-view name="Header"/>
    <router-view name="IndexSection"/>
    <router-view name="HourseList"/>
    <router-view name="Login"/>
    <router-view name="AddHouse"/>
    <router-view name="detail"/>
    <Footer/>
  </div>
</template>

<script>
  import Footer from "@/components/Footer";

  export default {
    name: 'App',
    components: {
      Footer
    },
    provide(){
      return {
        reload:this.reload
      }
    },
    data(){
      return{
        isRouterAlive: true
      }
    },
    methods: {
      reload () {
        this.isRouterAlive = false
        this.$nextTick(() => (this.isRouterAlive = true))
      }
    }

  }
</script>

<style>

</style>
