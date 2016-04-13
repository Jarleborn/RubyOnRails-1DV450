'use strict'
angular
	.module("1DV450")
	.controller("TagCreateController", TagCreateController); // registrera med namn, funktion

// inject the service - no need if we use the registered name as the funtion parameters eg. PlayerService
//PlayerListController.$inject = ['PlayerService'];

function TagCreateController(tagCRUDService) {

	var that = this;
	this.save = function() {

		tagCRUDService.createtag(this.tag.name).then( tag =>{
			this.status = "Du har lysckats skapa ett nytt systembolag";
			this.color = "teal";
			
		}).catch(e => {
			console.log(e);
			if (e.status == 404) {
				console.log("Fel uppgifter bror");
				this.status = "Du har gjort fel, vänligen försök igen";
			this.color = "red darken-1";
			}
			else{
				this.status = "Du har gjort fel, vänligen försök igen";
			this.color = "red darken-1";
			}
		});
	};
}