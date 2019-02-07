<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title> [bbs_reply.jsp]</title>
	<style type="text/css">
	   *{font-size:13pt; font-family: MV Boli;}
	</style>
</head>
<body>
  
 <!-- board_reply.jsp문서  단독실행금지 -->
<br>
<form  method="get"  action="reply.do" >
  <table width="700">
 	<input type="hidden"  name="b_no"  value="${dto.b_no}">
 	<tr>
 	  <td align ="left">ID: &nbsp;
 		<input type="text"  name="br_id" size=20>
 		<input type="submit" value="쓰기 " style="height:25pt;">     
 	  </td>
 	</tr>
 	
 	<tr>
 	  <td align ="left">
 		내용: <textarea  name="br_content" cols="60" rows=3 style="resize:none;"></textarea>
 	  </td>
 	</tr>
  </table>
 </form>

  <table width="700">
   <tr  bgcolor="lightblue"  height='30'  align="center">
 	   <td colspan=5>댓글 데이터 내용 표시</td>       
   </tr>
  <c:forEach var="dto" items="${rlist}">
  <tr onmouseover="style.background='lightblue'" onmouseout="style.background=''">
  	<td width=50> ${dto.rrn}  </td> 
    <td width=100> ${dto.br_id}  </td> 
 	<td width=300> ${dto.br_content} </td>
 	<td width=100> 
 	   <input type="button" onclick="location.href='reply_delete.do?idx=${dto.br_no}&b_idx=${dto.b_no}'" value="삭제">
	   <input type="button" onclick="location.href='reply_preEdit.do?idx=${dto.br_no}&b_idx=${dto.b_no}'" value="수정">
	    
 	 </td>       
  </tr>
  </c:forEach>

</table>	
</body>
</html>