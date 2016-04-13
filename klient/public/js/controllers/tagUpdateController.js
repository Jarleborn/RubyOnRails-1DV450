// 'use strict'
angular
	.module("1DV450")
	.controller("tagUpdateController", tagUpdateController); // registrera med namn, funktion



function tagUpdateController(PositionService, $routeParams, tagCRUDService) {
	
 PositionService.getOneTag($routeParams.id)
  .then(syst => {
    this.syst = syst.data;
    console.log(this.syst)
    
    //console.log(this.systList);
  }).catch(er => {
    console.log(er);
    this.status = "Hittade inte taggen :/";
   });

  this.update = function () {
  	console.log("HHÄÄÄÄÄÄÄÄÄÄÄR ------>    ", this.syst );
  	tagCRUDService.updateUsersTag($routeParams.id, this.syst.name)
    .then(syst => {
        this.status = "Du har lysckats uppdatera ett systembolag";
        this.color = "teal";
      }).catch(e => {
          console.log(e);
          if (e.status == 404) {
            console.log("Fel uppgifter bror");
            this.status = "Du har gjort fel, vänligen försök igen";
            this.color = "red darken-1";
          } else {
            this.status = "Du har gjort fel, vänligen försök igen";
            this.color = "red darken-1";
          }
        })
  }
	// systembolagCRUDService.updateUsersSystembolag();
	
}

