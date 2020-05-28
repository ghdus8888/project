<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "project.LogonDBBean" %>
<%@ page import = "java.sql.Timestamp" %>

<meta name="viewport" content="width=device-width,initial-scale=1.0"/>
<link rel="stylesheet" href="../css/style.css"/>
<script src="js/jquery.min.js"></script>
<script src="register.js"></script>

<% request.setCharacterEncoding("utf-8");%>
<jsp:useBean id="member" class="project.LogonDataBean">
    <jsp:setProperty name="member" property="*" />
</jsp:useBean>

<%  


  LogonDBBean manager = LogonDBBean.getInstance();
  //사용자가 입력한 데이터저장빈 객체를 가지고 회원가입 처리 메소드호출
  manager.insertMember(member);
%>