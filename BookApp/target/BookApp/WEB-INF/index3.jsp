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
            		
            		id:id,
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
    		    $http.get('http://localhost:8080/SpringRestCrud/book/'+id).success(function(data) {
    		            $scope.books = data;	
    		            console.log($scope.books);
    		        });
            }
           
            
            
            </script>
		
		
		<script>
		var windowURL = window.location.href;
		var mrnumber = windowURL.split("/");
		var id = mrnumber[6];
		alert(id);
		</script>
		
	</head>

	<body class="no-trans" ng-app="mainApp">
	
	
	<br>
	<br>
	
	

	
	
	   
   <div ng-controller="afterregistration">    
       <table class= "table-bordered table striped"> 
   <tr>				
   					
				   <td>Book Name</td>
				   <td>Author Name</td>
				   <td>Genre</td>
				   <td>Pages</td>
				   <td>Year Published</td>
				   <td>Rating</td>
				   
				   
   </tr>
			 
			 <tr>
			  <td>{{books.book_name}}</td>
			  <td>{{books.author_name}}</td>
			  <td>{{books.genre}}</td>
			  <td>{{books.pages}}</td>
			  <td>{{books.year}}</td>
			  <td>{{books.rating}}</td>
			
			  </tr>
  </table> 
    </div> 
        
   <h1 align="center"> Add New Details</h1>              
           <form ng-controller="hello" class="form-inline"  ng-submit="submit()" id="formInfo" role="form">
			
             <p>If you want to delete above book press the belwo </p>
              
                <input  class= "btn btn-primary" type="submit" value="Delete">  
          
          
          
        <br>
        <br>
        <br>  
          
        
      </form>     
        
          
	</body>
</html>
