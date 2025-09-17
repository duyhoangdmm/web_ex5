<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List, murach.business.User, java.util.Date" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Thanks</title>
    <link rel="stylesheet" href="styles/main.css" type="text/css"/>
</head>
<body>
    <div class="card">
        <img src="images/murachlogo.jpg" alt="Murach" width="80">

        <h1>Thanks for joining our email list</h1>
        
        <p>Here is the information you entered:</p>

        <table class="info-table">
            <tr><td>Email:</td><td>${sessionScope.user.email}</td></tr>
            <tr><td>First Name:</td><td>${sessionScope.user.firstName}</td></tr>
            <tr><td>Last Name:</td><td>${sessionScope.user.lastName}</td></tr>
        </table>

        <hr>
        
        <h2>Additional Information:</h2>
        
        <p><strong>Current Date:</strong> ${requestScope.currentDate}</p>
        
        <p><strong>Customer Service Email:</strong> ${initParam.custServEmail}</p>
        
        <h3>First two users in session:</h3>

        <c:if test="${not empty sessionScope.users}">
            <c:forEach var="u" items="${sessionScope.users}" varStatus="loop" begin="0" end="1">
                <p>User ${loop.index + 1}: ${u.email} - ${u.firstName} ${u.lastName}</p>
            </c:forEach>
            <p><em>Total users in session: ${fn:length(sessionScope.users)}</em></p>
        </c:if>

        <c:if test="${empty sessionScope.users}">
            <p>No other users in session.</p>
        </c:if>


        <form action="emailList" method="get">
            <input type="hidden" name="action" value="join">
            <input type="submit" value="Return" class="btn">
        </form>
        
        <p><a href="index.jsp">Join again</a></p>
    </div>
</body>
</html>