'use strict'
angular
	.module("1DV450")
	.controller("NavigationController", NavigationController); // registrera med namn, funktion

// inject the service - no need if we use the registered name as the funtion parameters eg. PlayerService
//PlayerListController.$inject = ['PlayerService'];

function NavigationController($scope, LoginService) {

	$scope.isLoggedIn = function () {
		return LoginService.isLoggedIn();
	};	

	$scope.logout = function () {
		LoginService.logingout();
	};

}

