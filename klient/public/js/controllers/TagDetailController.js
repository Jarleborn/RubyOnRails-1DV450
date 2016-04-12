angular
  .module("1DV450")
  .controller("TagDetailController", TagDetailController); // registrera med namn, funktion

// inject the service - no need if we use the registered name as the funtion parameters eg. PlayerService
//PlayerListController.$inject = ['PlayerService'];

function TagDetailController(TagService,$routeParams) {
  TagService.getAllTagsWithSameIDAndSystemInfo($routeParams.id)
  .then(tag => {
    this.TagList = tag.data.systembolags;
    this.status = "Här är alla systembolag med den taggen";
    console.log(this.TagList);
  }).catch(er => {
    console.log(er);
    this.status = "Hittade inga systembolag med den taggen";
   });


}