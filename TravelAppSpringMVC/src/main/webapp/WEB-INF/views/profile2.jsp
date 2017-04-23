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


<div class="form-group">
<%request.getAttribute("username"); %>

                <input type="text"  class="form-control" id="username" name="username" path="username" disabled="true" placeholder="User Name" value="${sessionScope.username}">
            </div>
            <div class="form-group">
                <input type="password" class="form-control" id="password" name="password" path="password" disabled="true" placeholder="Password">
            </div>
            <div class="form-group">
                <input type="password" class="form-control" id="password2" disabled="true" placeholder="Confirm Password">
            </div>
             <div class="form-group">
                <input type="text" class="form-control" id="fname" name="firstName" disabled="true" path="firstName" placeholder="First Name">
            </div>
             <div class="form-group">
                <input type="text" class="form-control" id="lname" name="lastName" disabled="true" path="lastName" placeholder="Last Name">
            </div>
             <div class="form-group">
                <input type="text" class="form-control" id="email" name="email" disabled="true" path="email" placeholder="Email">
            </div>
            </div>
             <div class="form-group">
                <input type="text" class="form-control" id="profilepic" name="profilePictureURI" disabled="true" path="profilePictureURI" placeholder="Profile Picture">
            </div>
<!--             <a href="profile" class="btn btn-primary btn-block">Register</a> -->
<!--             <a href="login" class="btn btn-danger btn-block">Cancel</a> -->
            <input type="submit" name ="action"  value ="register" class="form-control">Register</input>
            <input type="submit" name ="action"  value ="cancel" class="form-control">Cancel</input>


</body>
</html>