angular
	.module("1DV450")
	.controller("TagListController", TagListController) // registrera med namn, funktion
	.directive('tagList', function() {
  return {
    restrict: 'E',
    templateUrl: '../../partials/customDirectoryTagList.html'
     
  };
});
// inject the service - no need if we use the registered name as the funtion parameters eg. PlayerService
//PlayerListController.$inject = ['PlayerService'];

function TagListController(TagService) {
	TagService.getAllTags()
	.then(tag => {
		this.TagList = tag.data.tags;
		console.log(this.TagList);
	});

}