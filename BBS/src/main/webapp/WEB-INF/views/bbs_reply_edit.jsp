<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> [bbs_reply_edit.jsp]</title>
	<style type="text/css">
	   *{font-size:13pt; font-weight:bold;  font-family: MV Boli;}
	   table, td{ border: 1px solid lightblue;}
	   table{width:40%; height: 100px; margin: auto; text-align: center; background-color:white;}
	   
	   body {background-color:#DCDADA;}    
	</style>
</head>
<body>
  
 
<br>
<form  method="get"  action="reply_edit.do" >
  <table>
 	<input type="hidden"  name="b_no"  value="${dto.b_no }">
 	<input type="hidden"  name="br_no"  value="${dto.br_no }">
 	
 	<tr align="left">
 	  <td><b>ID:</b>
 		<input type="text"  name="br_id" size=20 value="${dto.br_id}">
 		<input type="submit"  value="댓글수정"  style="height:25pt;">     
 	  </td>
 	</tr>
 	
 	<tr align="left">
 	  <td>
 		내용:<textarea  name="br_content" cols="60" rows=3 style="resize:none;">${dto.br_content}</textarea>
 	  </td>
 	</tr>
  </table>
 </form>

</body>
</html>