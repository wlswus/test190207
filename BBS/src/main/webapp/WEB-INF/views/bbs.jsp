<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>bbs.jsp</title>
	<style type="text/css">
	   *{font-size: 20pt; font-weight: bold; }
	   a{text-decoration:none;font-size: 20pt; font-weight: bold; }
	   a:hover{text-decoration:underline;font-size: 26pt; font-weight: bold; color:blue; }
	</style>
</head>
<body>
	<font color=blue>[board.jsp]</font> <p>
	 <form action="insert.do" enctype="multipart/form-data" method="post">
	 	아이디: <input type=text name="b_id" value=""> <br>
	 	닉네임: <input type=text name="b_name" value=""> <br>
	 	글제목: <input name="b_title" value=""> <br>
	 	글내용: <textarea type=text name="b_content" row="4" cols="20"></textarea> <br>
	 	파일:<input type="file" name="upload_f"><p>  <!-- img_file_name이름대신 upload__f -->
	 	  <input type="submit" value="등록">&nbsp;&nbsp;
	 	  <input type="reset" value="취소" onclick="location.href='list.do'">          
	 </form>

<p>

</body>
</html>













