<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/pages/header.jsp"/>
<div>
<% 

if(request.getAttribute("landmarks") == null){
%>
<jsp:include page="index-populars.jsp"/>
<%} %>
<jsp:include page="landmarks.jsp"/>
</div>
<jsp:include page="/WEB-INF/pages/footer.jsp"/>
