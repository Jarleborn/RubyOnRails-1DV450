// This should hold a list with all players
angular
  .module("1DV450")
  .factory('PositionService', PositionService); // register the recipe for teh service


// Here is the definition of teh service
function PositionService($http) {
  return {
    getAllPosition: function() {
          return $http.get("http://localhost:3000/api/systembolags?app_key=Key1&pos=true");
      },
     getOnePosition: function(id) {
          return $http.get("http://localhost:3000/api/systembolags/"+id+"?app_key=Key1&pos=true");
      }
  };

}
