<%@page import="com.neu.myapp.fbsocial.FBConnection"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta charset="UTF-8">
    <title>Register User</title>
</head>
<style>
body { padding-top: 70px; }
</style>
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
        
        <form>
            <div class="form-group">
                <label for="username">Username</label>
                <input type="text" class="form-control" id="username" placeholder="Alice" value="${name}">
            </div>
            <a href="login" class="btn btn-danger btn-block">Cancel</a>
        </form>
    </div>
</body>
</html>