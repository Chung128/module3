<%--
  Created by IntelliJ IDEA.
  User: Laptop
  Date: 6/3/2025
  Time: 5:01 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2>Simple Calculator</h2>
<fieldset>Calculator
  <form action="/calculator" method="post">
    <label>First operand : </label>
    <input type="text" name="first"/><br/>
    <label>Operator : </label>
    <select>
      <option value="+">Cộng</option>
      <option value="-">Trừ</option>
      <option value="*">Nhân</option>
      <option value="/">Chia</option>
    </select>
    <label>Second operand : </label>
    <input type="text" name="usd"/><br/>
    <input type = "submit" id = "submit" value = "Calculator"/>
  </form>
</fieldset>
</body>
</html>
