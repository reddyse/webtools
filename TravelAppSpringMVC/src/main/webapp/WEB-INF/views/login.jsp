<%@page import="com.neu.myapp.fbsocial.FBConnection"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" />
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Login</title>
    <style>/* Shared */
.loginBtn {
  box-sizing: border-box;
  position: relative;
  /* width: 13em;  - apply for fixed size */
  margin: 0.2em;
  padding: 0 15px 0 46px;
  border: none;
  text-align: left;
  line-height: 34px;
  white-space: nowrap;
  border-radius: 0.2em;
  font-size: 16px;
  color: #FFF;
}
   .fix{
    position:fixed;
    }
.loginBtn:before {
  content: "";
  box-sizing: border-box;
  position: absolute;
  top: 0;
  left: 0;
  width: 34px;
  height: 100%;
}
.loginBtn:focus {
  outline: none;
}
.loginBtn:active {
  box-shadow: inset 0 0 0 32px rgba(0,0,0,0.1);
}


/* Facebook */
.loginBtn--facebook {
  background-color: #4C69BA;
  background-image: linear-gradient(#4C69BA, #3B55A0);
  /*font-family: "Helvetica neue", Helvetica Neue, Helvetica, Arial, sans-serif;*/
  text-shadow: 0 -1px 0 #354C8C;
}
.loginBtn--facebook:before {
  border-right: #364e92 1px solid;
  background: url('https://s3-us-west-2.amazonaws.com/s.cdpn.io/14082/icon_facebook.png') 6px 6px no-repeat;
}
.loginBtn--facebook:hover,
.loginBtn--facebook:focus {
  background-color: #5B7BD5;
  background-image: linear-gradient(#5B7BD5, #4864B1);
}
    @IMPORT url("");</style>
</head>
<body style="background-color:#282828; background-image: url('resources/images/Travellophilia2ac.jpg');background-size:cover;background-repeat:no-repeat">
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
    
      
    </div>

  </div>
</nav>
<jsp:scriptlet>FBConnection fbConnection = new FBConnection();</jsp:scriptlet>
    <div class="container">
        <div class="row">
        	<div class="col-md-4">&nbsp;</div>
        	<div class="col-md-4">&nbsp;</div>
        	<div class="col-md-4">&nbsp;</div>
        	</div>
          <div class="row">
        	<div class="col-md-4">&nbsp;</div>
        	<div class="col-md-4">&nbsp;</div>
        	<div class="col-md-4">&nbsp;</div>
        	</div>	
        <div class="row">
        	<div class="col-md-4"></div>
        	<div class="col-md-4">
        		<form method="post" action="/myapp/register">
		           
		             <%--<a href="<%=fbConnection.getFBAuthUrl()%>" class=" loginBtn loginBtn--facebook btn-block">Login</button>--%> 
		            <%--<a href="traveloptions" class=" loginBtn loginBtn--facebook btn-block">Login</button>--%>
		            
		            <div  class="form-group">
		            <input type="text" name ="username" class="form-control" placeholder="Username">Username</input>
		            <input type="password" name ="password" class="form-control" placeholder="Password">Password</input>
		            <input type="submit" name ="action"  value ="Login" class="form-control">Login</input>
		            <input type="submit" name ="action"  value ="register" class="form-control">Register</input>
<!-- 		            <a href="register" class="form-control"></a> -->
		            <div>
		            
		        </form>
        	</div>
        	<div class="col-md-4"></div>
        </div>
        
    </div>
     <!-- Footer -->   
 <nav class="navbar navbar-inverse navbar-fixed-bottom">
  <div class="container-fluid">
    By Zalak,Praneeth and Ankur
  </div>
</body>
</html>