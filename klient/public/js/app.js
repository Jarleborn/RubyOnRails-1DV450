angular
  .module("1DV450", ['ngRoute'], ['ngMap']) // you must inject the ngRoute (included as a separate js-file)
  .config(['$routeProvider', '$locationProvider',
    function($routeProvider, $locationProvider) {
      $routeProvider.
        when('/', {
          templateUrl: '/partials/index.html',
          controller: 'MapController',
          controllerAs: 'map'
        }).
        when('/systembolags', {
          templateUrl: '/partials/systembolags-list.html',
          controller: 'SystembolagListController',
          controllerAs: 'systembolags' // players could be seen as an instance of the controller, use it in the view!
        }).
         when('/tags', {
          templateUrl: '/partials/tags-list.html',
          controller: 'TagListController',
          controllerAs: 'tags' // players could be seen as an instance of the controller, use it in the view!
        }).
        when('/tags/:id', {
          templateUrl: '/partials/tags-deatail.html',
          controller: 'TagDetailController',
          controllerAs: 'tag'
        }).
        when('/systembolags/:id', {
          templateUrl: '/partials/systembolag-deatail.html',
          controller: 'SystembolagDetailController',
          controllerAs: 'systembolag'
        }).
        otherwise({
          redirectTo: '/'
        });
      $locationProvider.html5Mode(true); // This removes the hash-bang and use the Session history management >= IE10

    }]);

 