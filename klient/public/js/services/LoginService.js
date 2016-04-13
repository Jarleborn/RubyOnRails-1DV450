// This should hold a list with all players
angular
  .module("1DV450")
  .factory('LoginService', LoginService); // register the recipe for teh service


// Here is the definition of teh service
function LoginService($http, $sessionStorage) {

  return {


    autchenticate: function(usrnmae, pass) {

      console.log(pass);
      var req = {
        method: "post",
        url: "http://localhost:3000/knock/auth_token?key=cest_key",
        data: {
          "auth": {
            "name": usrnmae,
            "password": pass
          }
        }

      };
      return $http(req);

    },

    isLoggedIn: function() {
      return $sessionStorage.isUserLoggedIn;
    },

    logingout: function() {
      $sessionStorage.$reset();
    },

    getJWT: function() {
      return $sessionStorage.jwt;
    }

  };

}