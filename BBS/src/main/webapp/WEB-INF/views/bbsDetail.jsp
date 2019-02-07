<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.net.URLEncoder" %>

<html>
<head>
<title>[bbsDetail.jsp]</title>
  <style type="text/css">
	*{font-size:15pt; font-weight:bold; font-family: MV Boli;}
	a{text-decoration:none ;font-size:15pt; font-weight:bold;}
	a:hover{ text-decoration:underline ;font-size:15pt; font-weight:bold;}
	
	table, td{ border: 1px solid lightblue;}
	table{width:40%; height: 100px; margin:auto; text-align: center; background-color:white;}
	
	body {background-color:#DCDADA;}
  </style>
	
</head>
<body>
  <table>
   
   <tr>
   	<td align="left" colspan="5">
   	<font  color='grey' style="font-size:20pt" >${dto.b_title}</font>
   	</td>
   </tr>
   
   <tr>
   	<td align="left" colspan="5">
   	 글쓴이 : ${dto.b_name} <br>
	</td>
   </tr>
   
   <tr>
   	<td colspan="5">  
   	 <a href="download.do?fidx=${dto.b_file_name}&idx=${dto.b_no}">  
	 <img src ='${pageContext.request.contextPath}/resources/upload/${dto.b_file_name}' border=0></a>
	 <br> 
	 ${dto.b_content} 
	</td>
   </tr>   
   
   <tr>
	<td>
	 <a href="index.jsp">[index.jsp]</a>
	 <a href="write.do">[신규등록]</a>
	 <a href="list.do">[전체출력]</a>
     <a href="delete.do?idx=${dto.b_no}">[삭제]</a>
	 <a href="preEdit.do?idx=${dto.b_no}">[수정]</a>
	</td>
   </tr>
</table>
<hr>
	
   <!-- jstl  import -->
   <c:import url="/reply_list.do" />
    
</body>
</html>

















