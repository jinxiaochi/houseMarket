<template>
  <!--主页的主体部分-->
  <section>
    <search-box></search-box>
    <br/><br/>
    <hr/>
    <NewRecommand></NewRecommand>
    <br/><br/><br/>
    <hr/>
    <OldRecommand></OldRecommand>
    <br/><br/>
  </section>
</template>

<script>
  import SearchBox from "./searchBox";
  import OldRecommand from "./OldRecommand";
  import NewRecommand from "./NewRecommand";



  export default {
    name: "Section",
    components: {NewRecommand, OldRecommand, SearchBox},
    component:{
      SearchBox,
      OldRecommand,
      NewRecommand
    }
  }
</script>

<style scoped>

</style>
