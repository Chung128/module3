<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<h2>Simple Calculator</h2>
<fieldset>
    <legend>Calculator</legend>
    <form action="/calculator" method="post">
        <label>First operand : </label>
        <input type="text" name="first"/><br/>
        <label>Operator : </label>
        <select>
            <option value="+">Cộng</option>
            <option value="-">Trừ</option>
            <option value="*">Nhân</option>
            <option value="/">Chia</option>
        </select><br>
        <label>Second operand : </label>
        <input type="text" name="usd"/><br/>
        <input type = "submit" id = "submit" value = "Calculator"/>
    </form>
</fieldset>
</body>
</html>