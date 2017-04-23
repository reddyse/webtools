<%@page import="com.neu.myapp.fbsocial.FBConnection"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
<table>
<c:forEach var="user" items="${User}">
											<tr>
												<td>${user.username}</td>
												<%--<td>${travelPlan.lat}</td>
												<td>${travelPlan.lng}</td> --%>
										    </tr>
</c:forEach>
</table>
</body>
</html>