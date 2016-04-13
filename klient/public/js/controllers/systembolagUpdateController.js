'use strict'
angular
  .module("1DV450")
  .controller("systembolagUpdateController", systembolagUpdateController); // registrera med namn, funktion



function systembolagUpdateController(PositionService, $routeParams, systembolagCRUDService, TagService) {

  PositionService.getOnePosition($routeParams.id)
    .then(syst => {
      this.syst = syst.data;

      //console.log(this.systList);
    }).catch(er => {
      console.log(er);
      this.status = "Hittade inga systembolaget :/";
    });

  this.update = function() {
   

    systembolagCRUDService.updateUsersSystembolag($routeParams.id, this.syst.name, this.syst.description, this.syst.adress)
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
        // systembolagCRUDService.updateUsersSystembolag();

      };
  
};