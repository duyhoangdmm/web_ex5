<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Join Email List</title>
    <link rel="stylesheet" href="styles/main.css" type="text/css"/>
</head>
<body>
    <div class="card">
        <img src="images/murachlogo.jpg" alt="Murach" width="80">
        
        <h1>Join our email list</h1>
        <p>To join our email list, enter your name and email address below.</p>
        
        <form action="emailList" method="post">
            <input type="hidden" name="action" value="add">
            
            <div class="form-group">
                <label>Email:</label>
                <input type="email" name="email" value="${sessionScope.user.email}" required>
            </div>
            
            <div class="form-group">
                <label>First Name:</label>
                <input type="text" name="firstName" value="${sessionScope.user.firstName}" required>
            </div>
            
            <div class="form-group">
                <label>Last Name:</label>
                <input type="text" name="lastName" value="${sessionScope.user.lastName}" required>
            </div>
            
            <input type="submit" value="Join Now" class="btn btn-primary">
        </form>
    </div>
</body>
</html>