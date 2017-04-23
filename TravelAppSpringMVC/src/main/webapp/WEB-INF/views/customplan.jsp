<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.neu.myapp.fbsocial.FBConnection"%>
<%@ page session="false"%>
<%
    response.setHeader("Cache-Control", "no-cache"); //HTTP 1.1
    response.setHeader("Pragma", "no-cache"); //HTTP 1.0
    response.setDateHeader("Expires", 0); //prevents caching at the proxy server
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Case</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" href="css/style.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
$(document).ready(function(){
    $("button").click(function(){
        $.ajax({url: "http://tour-pedia.org/api/getPlacesStatistics", success: function(result){
            console.log(result);
        }});
    });
	$("#b2").click(function(){
        $.ajax({url: "https://maps.googleapis.com/maps/api/place/details/json?placeid=ChIJN1t_tDeuEmsRUsoyG83frY4&key=AIzaSyA78BUSMaM422PW4HFz_pwKEFmPU00rL5A", success: function(result){
            console.log(result);
        }});
    });
});
</script>
</head>
<body>

<c:set var="userSession" value="${sessionScope.user}" />
	<%-- <c:choose>
	<c:when test="${not empty userSession}"> --%>
	<jsp:scriptlet>FBConnection fbConnection = new FBConnection();</jsp:scriptlet>
	<div id="fb-root"></div>
	<script>
		window.fbAsyncInit = function() {
		    FB.init({
		      appId      : '1524813154490050', // App ID
		      status     : true, // check login status
		      cookie     : true, // enable cookies to allow the server to access the session
		      oauth      : true, // enable OAuth 2.0
		      xfbml      : true  // parse XFBML
		    });

		    // Additional initialization code here
		  };

		  // Load the SDK Asynchronously
		  (function(d){
		     var js, id = 'facebook-jssdk'; if (d.getElementById(id)) {return;}
		     js = d.createElement('script'); js.id = id; js.async = true;
		     js.src = "http://connect.facebook.net/en_US/all.js";
		     d.getElementsByTagName('head')[0].appendChild(js);
		   }(document));
		
	</script>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="home">MyTravelApp</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="active"><a href="home">Home</a></li>
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">Profile <span class="caret"></span></a>
        </li>
        
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <!--  <li><a href="#"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>-->
				<li><a href="<%=fbConnection.getFBAuthUrl()%>"><img class="img-circle" src="${profile}" height="27"></a></li>
				<li><a href="<%=fbConnection.getFBAuthUrl()%>">${name}</a></li>
				<li><a href="logout.htm" onclick="FB.logout(function(response){});" >Logout</a></li>
        </li>
  </ul>
    </div>
  </div>
</nav>
  
<div class="container">
	<div class="row">
		<div class="col-md-2 col-lg-2">
		&nbsp;
		</div>
		<div class="col-md-8 col-lg-8">
		&nbsp;
		</div>
		<div class="col-md-2 col-lg-2">
		&nbsp;
		</div>
	</div>
	<div class="row">
		<div class="col-md-2 col-lg-2">
		&nbsp;
		</div>
		<div class="col-md-8 col-lg-8">
		<h1 class="text-center">Itenary for ${cityName}</h3>
			<div class="row">
			  <div class="col-lg-12">
				&nbsp;
			  </div><!-- /.col-lg-6 -->
			</div><!-- /.row --><div class="row">
			  <div class="col-lg-12">
				&nbsp;
			  </div><!-- /.col-lg-6 -->
			</div><!-- /.row -->
			<div class="row">
			  <div class="col-lg-4">
			  	<div class="panel panel-primary">
			      <div class="panel-heading">Cheapest</div>
			      <div class="panel-body">
			      	<table class="table table-hover">
									<thead>

										<tr>
											<th>List of Places</th>
											</tr>


									</thead>
									<tbody>
										<c:forEach var="travelPlan" items="${attractionList}">
											<tr>
												<td>${travelPlan.name} , ${travelPlan.address}</td>
												<%--<td>${travelPlan.lat}</td>
												<td>${travelPlan.lng}</td> --%>
										    </tr>
										</c:forEach>

									</tbody>
						</table>
			      </div>
			    </div>
								
								
			    
			  </div><!-- /.col-lg-6 -->
			  <div class="col-lg-4">
			  <div class="panel panel-success">
			      <div class="panel-heading">Hot-Seller</div>
			      <div class="panel-body">
			      	<table class="table table-hover">
									<thead>

										<tr>
											<th>List of Places</th>
										</tr>


									</thead>
									<tbody>
										<c:forEach var="travelPlan" items="${attractionList1}">
											<tr>
												<td>${travelPlan.name} , ${travelPlan.address}</td>
												<%--<td>${travelPlan.lat}</td>
												<td>${travelPlan.lng}</td> --%>
										    </tr>
										</c:forEach>

									</tbody>
						</table>
			      </div>
			    </div>
			    
			  </div><!-- /.col-lg-6 -->
			  <div class="col-lg-4">
			  <div class="panel panel-danger">
			      <div class="panel-heading">Expensive</div>
			      <div class="panel-body">
			      	<table class="table table-hover">
									<thead>

										<tr>
											<th>List of Places</th>
											</tr>


									</thead>
									<tbody>
										<c:forEach var="travelPlan" items="${attractionList2}">
											<tr>
												<td>${travelPlan.name} , ${travelPlan.address}</td>
												<%--<td>${travelPlan.lat}</td>
												<td>${travelPlan.lng}</td> --%>
										    </tr>
										</c:forEach>

									</tbody>
						</table>
			      </div>
			    </div>
			    
			  </div><!-- /.col-lg-6 -->
			</div><!-- /.row -->
			<div class="row">
			  <div class="col-lg-12">
				&nbsp;
			  </div><!-- /.col-lg-6 -->
			</div><!-- /.row -->
			<div class="row">
			  <div class="col-lg-12">
				<form class="form-inline">
				
							
				<div class="row">
				  <div class="col-lg-12">
					&nbsp;
				  </div><!-- /.col-lg-6 -->
				</div>
				<a href="register" class="btn btn-success btn-block">Register</a>
			  </form>
			  </div><!-- /.col-lg-6 -->
			</div><!-- /.row -->
			
		</div>
		<div class="col-md-2 col-lg-2">
		&nbsp;
		</div>
	</div>
	<div class="row">
		<div class="col-md-2 col-lg-2">
		&nbsp;
		</div>
		<div class="col-md-8 col-lg-8">
		&nbsp;
		</div>
		<div class="col-md-2 col-lg-2">
		&nbsp;
		</div>
	</div>
  
</div>
    
 <!-- Footer -->   
 <nav class="navbar navbar-inverse navbar-fixed-bottom">
  <div class="container-fluid">
    Footer
  </div>
</nav>
</body>
</html>