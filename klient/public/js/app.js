angular
  .module("1DV450", ['ngRoute', 'ngMap', 'ngStorage']) // you must inject the ngRoute (included as a separate js-file)
  .config(['$routeProvider', '$locationProvider',
    function($routeProvider, $locationProvider) {
      $routeProvider.
        when('/', {
          templateUrl: '/partials/index.html',
          controller: 'MapController',
          controllerAs: 'indexmap'
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
        when('/usersystembolags', {
          templateUrl: '/partials/listUsersSystembolags.html',
          controller: 'systembolagCRUDController',
          controllerAs: 'usersystembolags'
        }).
        when('/usersystembolags/:id', {
          templateUrl: '/partials/updateUsersSystembolags.html',
          controller: 'systembolagUpdateController',
          controllerAs: 'updateusersystembolags'
        }).
        when('/systembolags/:id', {
          templateUrl: '/partials/systembolag-deatail.html',
          controller: 'SystembolagDetailController',
          controllerAs: 'systembolag'
        }).
         when('/login', {
          templateUrl: '/partials/login.html',
          controller: 'LoginController',
          controllerAs: 'login'
        }).
        otherwise({
          redirectTo: '/'
        });
      $locationProvider.html5Mode(true); // This removes the hash-bang and use the Session history management >= IE10

    }]);

 