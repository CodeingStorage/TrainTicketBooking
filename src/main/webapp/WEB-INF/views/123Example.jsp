<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sp" uri="http://www.springframework.org/tags/form" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
${ schedules }
<tbody>
				<c:forEach items="${ schedules }" var="schedule">
				<tr>
					</p><td>${ schedule.trainNo }</td>
					<td>${ schedule.departStation }</td>
					<td>${ schedule.arriveStation }</td>
					<td>${ schedule.departTime }</td>
					<td>${ schedule.arriveTime }</td>
					
				
				</tr>
				</c:forEach>
			</tbody>	
</body>
</html>