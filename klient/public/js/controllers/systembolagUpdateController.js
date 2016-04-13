// 'use strict'
angular
	.module("1DV450")
	.controller("systembolagUpdateController", systembolagUpdateController); // registrera med namn, funktion



function systembolagUpdateController(PositionService, $routeParams) {
	
 PositionService.getOnePosition($routeParams.id)
  .then(syst => {
    this.syst = syst.data;
    console.log(this.syst)
    
    //console.log(this.systList);
  }).catch(er => {
    console.log(er);
    this.status = "Hittade inga systembolaget :/";
   });
	// systembolagCRUDService.updateUsersSystembolag();
	
}

