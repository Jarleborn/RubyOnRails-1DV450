'use strict'
angular
	.module("1DV450")
	.controller("systembolagCRUDController", systembolagCRUDController); // registrera med namn, funktion



function systembolagCRUDController(systembolagCRUDService, $sessionStorage, $http, $route) {

	systembolagCRUDService.getAllUsersSystembolag($sessionStorage.user).then(value => {
		console.log(value)
		return $http.get("http://localhost:3000/api/systembolags?app_key=Key1&creator_id=" + value.data.creators[0].id);
	}).then(value => {
		console.log(value)
			this.ownSystembolag = value.data.systembolags;
		}).catch(e => {
			console.log(e);
		});


		this.remove = function (id) {
			$route.reload();
			systembolagCRUDService.removeUsersSystembolag(id).then(value =>{

			}).catch(e => console.log(e))
			// body...
		}
	
}

