//'use strict'
angular
	.module("1DV450")
	.controller("SystembolagCreateController", SystembolagCreateController); // registrera med namn, funktion


function SystembolagCreateController(systembolagCRUDService, TagService) {
	TagService.getAllTags().then(tag => {
		this.TagList = tag.data.tags;
		console.log(this.TagList);
	});
	this.save = function() {
		var getTags = (tags) => {
      return tags.filter(tag => {
          return tag.hasOwnProperty('val') && tag.val === true;
      })
      .map(tag => {
          return {
              name: tag.name
          };
      });
  };
		console.log(this)

		if(this.syst == undefined){
			this.status = "Du har gjort fel, vänligen försök igen";
			this.color = "red darken-1";
		}
		systembolagCRUDService.createSystembolag( this.syst.name, this.syst.description, this.syst.adress, getTags(this.TagList) )
		.then( syst =>{
			syst.mess = 'Succes!'
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

