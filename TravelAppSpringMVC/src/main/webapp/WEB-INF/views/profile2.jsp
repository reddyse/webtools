<%@page import="com.neu.myapp.fbsocial.FBConnection"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" href="css/style.css">
  <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" />
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta charset="UTF-8">
    <title>User Profile</title>
</head>
<body>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
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
    </div>
  </div>
</nav>
  
<div class="container">
	<div class="row">
		<div class="col-md-2 col-lg-2">
		&nbsp;
		</div>
	</div>

<form:form method="post" action="" modelAttribute="results" >
<c:forEach var="user" items="${User}">
<div class="panel-body">
<table>
<tr><td>
<div class="form-group">
<h3><input type="label" value="Hello ${user.username}" name="name"/></h3>
</div>
</td><td>
<div class="form-group">
<h3>
<img src="${imageBase64}" width="50" height="50" />
</h3>
</div>
</td></tr></table>


<div class="form-group">
<input type="label" value="Username" name="name"/>
<input type="text" value="${user.username}" name="username" disabled />
</div>
<div class="form-group">
<input type="label" value="First Name" name="name"/>
<input type="text" value="${user.firstName}" name="firstName" disabled />
</div>
<div class="form-group">
<input type="label" value="Last Name" name="name"/>
<input type="text" value="${user.lastName}" name="lastName" disabled />
</div>
<div class="form-group">
<input type="label" value="Email" name="name"/>
<input type="text" value="${user.email}" name="email" disabled />
</div>
</div>
</c:forEach>
<input type="submit" name ="action"  value ="Login" class="btn btn-block btn-primary" class="form-control"></input>
</form:form>
</body>
</html>