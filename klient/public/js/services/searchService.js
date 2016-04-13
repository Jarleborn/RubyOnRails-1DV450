angular
  .module("1DV450")
  .factory('searchService', searchService); 


function searchService($http) {
  return {
    getResults: function(data) {
          return $http.get("http://localhost:3000/api/systembolags?app_key=Key1&query="+data);
      }
     
  };

}