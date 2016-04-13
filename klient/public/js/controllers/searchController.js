'use strict'
angular
	.module("1DV450")
	.controller("searchController", searchController); // registrera med namn, funktion



function searchController(searchService) {

	this.ser = function () {
		searchService.getResults(this.indata).then(res =>{
			this.result = res.data.systembolags
			console.log(this.result)
		})
	}
	
}