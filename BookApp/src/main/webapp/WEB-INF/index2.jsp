<!DOCTYPE html>
<html lang="en">
	<head>
    	
		<meta charset="utf-8">
		<title>Book</title>
	
        <!-- Mobile Meta -->
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.0.8/angular.min.js"></script>
		<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  		<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
		
		<script type="text/javascript">
		var mainApp = angular.module('mainApp', []);
        mainApp.controller('hello', function($scope,$http) {    
		var sectionTypeVM = new Object();
            sectionTypeVM.SectionTypeId = 0;
           // sectionTypeVM.Name = $scope.formInfo;
            $scope.formInfo={
            		
            		
            		book_name:formInfo.book_name,
            		author_name:formInfo.author_name,
            		genre:formInfo.genre,
            		pages:formInfo.pages,
            		year:formInfo.year,
            		rating:formInfo.rating
            		
            		
            				
            }; 
            $scope.submit = function(){
            	console.log($scope.formInfo);
            
                
            $http({
                method: 'POST',
                url: 'http://localhost:8080/SpringRestCrud/book/create',
                dataType: 'json',
                data: $scope.formInfo,
                headers: { 'Content-Type': 'application/json; charset=UTF-8' }
            }).success(function (data){
            	alert(JSON.stringify(data));
            	
            	//$scope.books=data;
            	
            	}).error(function (data) {alert("error");});
        }//submit
        
        
       
            });//hello ends
		
            function afterregistration($scope, $http) {
    		    $http.get('http://localhost:8080/SpringRestCrud/book/list').success(function(data) {
    		            $scope.books = data;	
    		            console.log(data)
    		        });
            }
           
            
            
            </script>
		
	</head>

	<body class="no-trans" ng-app="mainApp">
	
	
	<br>
	<br>
	
	

	
	
	
	
	<br>
	<br>
	
	<br>
	
	    <h1 align="center"> Add Book</h1>              
           <form ng-controller="hello" class="form-inline"  ng-submit="submit()" id="formInfo" role="form">

              <input type="text" class="form-control login-field" value="" placeholder="Book Name" ng-model="formInfo.book_name" id="login-name" />
              <input type="text" class="form-control login-field" value="" placeholder="Author Name" ng-model="formInfo.author_name" id="login-name" />   
              <input type="text" class="form-control login-field" value="" placeholder="Genre" ng-model="formInfo.genre" id="login-name" />   
              <input type="text" class="form-control login-field" value="" placeholder="Pages" ng-model="formInfo.pages" id="login-name" /> 
              <input type="text" class="form-control login-field" value="" placeholder="Year" ng-model="formInfo.year" id="login-name" />   
              <input type="text" class="form-control login-field" value="" placeholder="Rating" ng-model="formInfo.rating" id="login-name" />
              
                <input  class= "btn btn-primary" type="submit" value="Add Book">  
          
          
          
        <br>
        <br>
        <br>  
          
        
      </form>    
   <div ng-controller="afterregistration">    
       <table class= "table-bordered table striped"> 
   <tr>				
   					<td> Index </td>
				   <td>Book Name</td>
				   <td>Author Name</td>
				   <td>Genre</td>
				   <td>Pages</td>
				   <td>Year Published</td>
				   <td>Rating</td>
				   <td>Edit</td>
				   
   </tr>
  <tr ng-repeat="x in books">
  <td>{{$index + 1}}</td>
  <td>{{x.book_name}}</td>
  <td>{{x.author_name}}</td>
  <td>{{x.genre}}</td>
  <td>{{x.pages}}</td>
  <td>{{x.year}}</td>
  <td>{{x.rating}}</td>
  </tr>
  </table> 
    </div> 
          
	</body>
</html>
