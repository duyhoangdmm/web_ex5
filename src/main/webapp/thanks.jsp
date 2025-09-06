<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List, murach.business.User, java.util.Date" %>
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
        
        <%
            // Get users from session - SCRIPTLET được phép sử dụng
            List<User> users = (List<User>) session.getAttribute("users");
            if (users != null && !users.isEmpty()) {
                int count = Math.min(users.size(), 2);
                for (int i = 0; i < count; i++) {
                    User u = users.get(i);
        %>
            <p>User <%= i + 1 %>: <%= u.getEmail() %> - <%= u.getFirstName() %> <%= u.getLastName() %></p>
        <%
                }
        %>
            <p><em>Total users in session: <%= users.size() %></em></p>
        <%
            } else {
        %>
            <p>No other users in session.</p>
        <%
            }
        %>

        <form action="emailList" method="get">
            <input type="hidden" name="action" value="join">
            <input type="submit" value="Return" class="btn">
        </form>
        
        <p><a href="index.jsp">Join again</a></p>
    </div>
</body>
</html>