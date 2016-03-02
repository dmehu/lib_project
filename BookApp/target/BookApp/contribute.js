var mainApp = angular.module('mainApp', []);
        mainApp.controller('hello', function($scope,$http) {    
var sectionTypeVM = new Object();
            sectionTypeVM.SectionTypeId = 0;
           // sectionTypeVM.Name = $scope.formInfo;
            $scope.formInfo={
            		
            		
            		name:formInfo.name,
            		imageurl:formInfo.imageurl,
            		address:formInfo.address,
            		grade:formInfo.grade
            		
            				
            }; 
            $scope.submit = function(){
            	console.log($scope.formInfo);
            	alert("Hello contribute");
                
            $http({
                method: 'POST',
                url: 'http://localhost:8080/school/service/save',
                dataType: 'json',
                data: $scope.formInfo,
                headers: { 'Content-Type': 'application/json; charset=UTF-8' }
            }).success(function (data) {alert(data);}).error(function (data) {alert(data);});
        }//submit
            });//hello ends
