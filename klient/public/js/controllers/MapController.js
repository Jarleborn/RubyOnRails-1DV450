	'use strict'

	angular
		.module("1DV450")
		.controller("MapController", MapController);

	function MapController(NgMap, $http, PositionService) {
		var that = this;


		NgMap.getMap().then((map) => {
			that.map = map; 
			PositionService.getAllPosition()
				.then(position => {
					this.showData = function(e, sys) {
						console.log(sys)
						that.sys = sys;
						console.log(sys)
						that.map.showInfoWindow('iw', this);
						//console.log(this.data);
					};
					this.PositionList = position.data.systembolags;
					console.log(this.PositionList);
				});
		});
	}