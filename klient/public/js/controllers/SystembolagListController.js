angular
	.module("1DV450")
	.controller("SystembolagListController", SystembolagListController); // registrera med namn, funktion

// inject the service - no need if we use the registered name as the funtion parameters eg. PlayerService
//PlayerListController.$inject = ['PlayerService'];

function SystembolagListController(PositionService) {
	PositionService.getAllPosition()
	.then(position => {
		this.PositionList = position.data.systembolags;
		console.log(this.PositionList)
	})

}