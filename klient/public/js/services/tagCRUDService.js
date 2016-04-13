'use strict' // This should hold a list with all players''
angular
  .module("1DV450")
  .factory('tagCRUDService', tagCRUDService); // register the recipe for teh service


// Here is the definition of teh service
function tagCRUDService($http, $sessionStorage) {
  return {
    getAllUsersTag: function(name) {
      return $http.get("http://localhost:3000/api/creators?app_key=Key1&name="+name);
        
      
    },
    removeUsersTag: function(sysid) {
       var req = {
        method: "delete",
        url: "http://localhost:3000/api/tags/" + sysid + "?app_key=Key1",
        data: "",
         headers: {
           'Authorization': $sessionStorage.jwt
         },
      };
      return $http(req);
    },
    updateUsersTag: function(sysid, name, desc, adress) {
      var req = {
        method: "put",
        url: "http://localhost:3000/api/tags/" + sysid + "?app_key=Key1",
        headers: {
           'Authorization': $sessionStorage.jwt
         },
        data: {
          "tag": {
            "name": name
            
          }
        }
      };
      return $http(req);
    },
    
    createtag: function (name) {

      var req = {
        method: "post",
        url: "http://localhost:3000/api/tags?app_key=Key1",
        headers: {
           'Authorization': $sessionStorage.jwt
         },
        data: {
          "tag": {
            "name": name
          }
        }
      };
      return $http(req);

    }

    

  };

}