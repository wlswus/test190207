<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>bbsEdit.jsp</title>
	<style type="text/css">
	   *{font-size: 20pt; font-weight: bold; font-family: MV Boli;}
	   a{text-decoration:none;font-size: 20pt; font-weight: bold; }
	   a:hover{text-decoration:underline;font-size: 26pt; font-weight: bold; color:blue; }
	</style>
</head>
<body>
   <font color=blue>[bbsEdit.jsp]</font> <p>
	
	<form action="edit.do" enctype="multipart/form-data" method="post">
	 <!-- hobby_idx는 꼭꼭꼭 hidden  -->
	 <input type="hidden" name="b_no" value="${dto.b_no}">
	 	<b>이름:</b> 
	 	  <input type=text name="b_name" value="${dto.b_name}"> <br>
	 	<b>제목:</b> 
	 	  <input type=text name="b_title" value="${dto.b_title}"> <br>
	 	<b>내용:</b><br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
	 	 <textarea name="b_content" rows="4" cols="20">${dto.b_content}</textarea> <br>
	 	<b>파일:</b>
	 	  <input type="file" name="upload_f">
	 	  <b><font color=red>[${dto.b_file_name}]파일</font></b>
	 	  <p>
	 	  
	 	  <input type="submit" value="수정">&nbsp;&nbsp;
	 	  <input type="reset" value="취소">          
	 </form>
 </body>


<p>
<a href="index.jsp">[index.jsp]</a>
<a href="write.do">[신규등록]</a>
<a href="list.do">[전체출력]</a>

</body>
</html>













