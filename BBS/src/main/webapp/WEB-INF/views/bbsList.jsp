<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>[bbsList.jsp]</title>
 	<style type="text/css">
	   *{font-size:13pt; font-weight:bold;  font-family: MV Boli;}
       a{font-size:13pt; font-weight:bold; color:#000000; text-decoration:blink;}
       a:hover{font-size:13pt; font-weight:bold; color:#7096FE; text-decoration:underline;}
       a:visited{font-size:13pt; font-weight:bold; color:#848484; text-decoration:none;}
       a:visited:hover{font-size:13pt; font-weight:bold; color:#7096FE; text-decoration:underline;}
       
       table, td{ border: 1px solid lightblue;}
	   table{width:60%; height: 100px; margin: auto; text-align: center; background-color:white;}
	   
	   body {background-color:#DCDADA;}              
	</style>
</head>
<body>
   <table cellpadding="0">
    <tr align="right">
      <td colspan="5"> &nbsp;&nbsp;</td>
    </tr>
    
    <tr bgcolor=lightblue height=30>
     <th>행번호</th> <th>글쓴이</th> <th>제 목</th> <th>작성일</th>
    </tr>
    
    <c:forEach var="dto" items="${list}">
    <tr onmouseover="style.background='lightblue'" onmouseout="style.background=''">
    	<td> ${dto.rn} </td>
    	<td> ${dto.b_name} </td>
    	<td> <a href="detail.do?idx=${dto.b_no}">${dto.b_title}</a> </td>
    	<td align="center"> <fmt:formatDate value="${dto.b_date}" pattern="YYYY-MM-dd hh:mm:ss"/></td>
    </tr>
    </c:forEach>
   
   <tr align="center">
   <td colspan="5">
   		<!-- 이전 -->
   		<c:choose> 
	   		<c:when test="${startpage != 1}">
	   	   		<a href="list.do?pageNum=${startpage-1}">[이전]</a>
	   		</c:when>
   		</c:choose>
   		
   	<c:forEach var="i" begin="${startpage}" end="${endpage}" step="1">
	   <c:choose>
	   	  <c:when test="${i==pageNUM}">
	   	   	<a href="list.do?pageNum=${i}${returnpage}">
	   	   	<font style="font-size:16pt; color:red">[${i}]</font></a>
	   	  </c:when>
	   	  <c:otherwise>
	   	   	<a href="list.do?pageNum=${i}${returnpage}">[${i}]</a>
	      </c:otherwise>
	   </c:choose>
   	</c:forEach>
   	
   		<!-- 다음 --> 
   		<c:choose> 
	   		<c:when test="${endpage<pagecount}">
	   	   		<a href="list.do?pageNum=${startpage+10}">[다음]</a>
	   		</c:when>
   		</c:choose>
   </td>
  </tr> 
   
  <tr align="center">
  	<td colspan="5">
  	<br>
  	 <form name="myform" action="list.do">
  	 	검색 :
  	 	<select name="keyfield" onchange="changeclear();">
  	 	   <option value="" selected>전체검색</option>
  	 	   <option value="b_name" <c:if test="${AA !=''}">selected</c:if>>이름검색</option>
  	 	   <option value="b_title" <c:if test="${BB !=''}">selected</c:if>>제목검색 </option>
  	 	   <option value="b_content" <c:if test="${CC !=''}">selected</c:if>>내용검색 </option>
  	 	</select>
  	 	<input type="text" name="keyword"  size=10  value="${sval}">
  	 	<input type="submit" value="search "> 
  	 	<input type="button" value="index" onclick="location.href='index.jsp'">
  	 	<input type="button" value="list" onclick="location.href='list.do'"> 
  	 </form>
  	</td>
  </tr>   
   <tr>
   	<td colspan="5" align="right">
	    <p>
		<a href="index.jsp">[index.jsp]</a>
		<a href="write.do">[신규등록]</a>
		<a href="home.do">[home.jsp]</a>
	</td>
  </tr>
</table>


</body>
</html>



