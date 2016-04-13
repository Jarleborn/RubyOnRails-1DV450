'use strict' // This should hold a list with all players''
angular
  .module("1DV450")
  .factory('systembolagCRUDService', systembolagCRUDService); // register the recipe for teh service


// Here is the definition of teh service
function systembolagCRUDService($http, $sessionStorage) {
  return {
    getAllUsersSystembolag: function(name) {
      return $http.get("http://localhost:3000/api/creators?app_key=Key1&name="+name);
        
      
    },
    removeUsersSystembolag: function(sysid) {
       var req = {
        method: "delete",
        url: "http://localhost:3000/api/systembolags/" + sysid + "?app_key=Key1",
        data: "",
         headers: {
           'Authorization': $sessionStorage.jwt
         },
      };
      return $http(req);
    },
    updateUsersSystembolag: function(userid, sysid, name, desc, tag, adress) {
      var req = {
        method: "put",
        url: "http://localhost:3000/api/systembolags" + sysid + "?app_key=Key1",
        headers: {
           'Authorization': $sessionStorage.jwt
         },
        data: {
          "systembolag": {
            "name": name,
            "description": desc,
            "tags": [{
              "name": tag
            }],
            "position": [{
              "adress": adress
            }]
          }
        }
      };
      return $http(req);
    }

    

  };

}