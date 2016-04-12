angular
  .module("1DV450")
  .factory('TagService', TagService); // register the recipe for teh service


// Here is the definition of teh service
function TagService($http) {
  return {
    getAllTags: function() {
          return $http.get("http://localhost:3000/api/tags?app_key=Key1");
      },

      getAllTagsWithSameIDAndSystemInfo: function(id) {
          return $http.get("http://localhost:3000/api/systembolags?app_key=Key1&tag_id="+id);
      }
  };

}

