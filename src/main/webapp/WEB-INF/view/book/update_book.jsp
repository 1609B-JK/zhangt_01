<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 2017/5/16
  Time: 14:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
<form id="book_edit_form">
  <input type="hidden" id="edit_book_id" value="${book.bookID}">
 书籍名称：<input id="edit_book_name" value="${book.bookName}" class="easyui-textbox" data-options="prompt:'请输入书籍名称'"><br>
</form>
</body>
</html>
