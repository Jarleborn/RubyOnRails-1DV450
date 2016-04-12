angular
  .module("1DV450")
  .controller("SystembolagDetailController", SystembolagDetailController); // registrera med namn, funktion

// inject the service - no need if we use the registered name as the funtion parameters eg. PlayerService
//PlayerListController.$inject = ['PlayerService'];

function SystembolagDetailController(PositionService,$routeParams) {
  PositionService.getOnePosition($routeParams.id)
  .then(syst => {
    this.systList = syst.data;
    this.status = "";
    console.log(this.systList);
  }).catch(er => {
    console.log(er);
    this.status = "Hittade inga systembolaget :/";
   });


}


