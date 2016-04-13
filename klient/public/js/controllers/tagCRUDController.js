'use strict'
angular
	.module("1DV450")
	.controller("tagCRUDController", tagCRUDController); // registrera med namn, funktion



function tagCRUDController(tagCRUDService, $sessionStorage, $http, $route) {

	tagCRUDService.getAllUsersTag($sessionStorage.user).then(value => {
		console.log(value)
		return $http.get("http://localhost:3000/api/tags?app_key=Key1&creator_id=" + value.data.creators[0].id);
	}).then(value => {
		console.log(value)
			this.ownTag = value.data.tags;
		}).catch(e => {
			console.log(e);
		});


		this.remove = function (id) {
			$route.reload();
			tagCRUDService.removeUsersTag(id).then(value =>{

			}).catch(e => console.log(e))
			// body...
		}
	
}