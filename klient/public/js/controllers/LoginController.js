'use strict'
angular
	.module("1DV450")
	.controller("LoginController", LoginController); // registrera med namn, funktion

// inject the service - no need if we use the registered name as the funtion parameters eg. PlayerService
//PlayerListController.$inject = ['PlayerService'];

function LoginController(LoginService, $sessionStorage) {

	var that = this;
	this.save = function() {

		LoginService.autchenticate(this.user.username, this.user.password).then(function(response) {
			console.log(response);
				$sessionStorage.isUserLoggedIn = true;
				$sessionStorage.jwt = response.data.jwt;
				$sessionStorage.user = that.user.username;
				that.status = "Inloggad";
				
				console.log("Inloggad");
			
		}).catch(e => {
			console.log(e);
			$sessionStorage.isUserLoggedIn = false;
				$sessionStorage.jwt = false;
				$sessionStorage.user = false;
			if (e.status == 404) {
				console.log("Fel uppgifter bror");
				that.status = "Fel uppgifter, försök igen";
			}
		});
	};

}