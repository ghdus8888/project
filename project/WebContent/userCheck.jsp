<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "project.LogonDBBean" %>
<script src="js/jquery.min.js"></script>

<%

  request.setCharacterEncoding("utf-8");
  String id = request.getParameter("id");
  String passwd = request.getParameter("passwd");
  LogonDBBean manager = LogonDBBean.getInstance();
  int check = manager.userCheck(id, passwd);
  // 처리결과
  if (check == 1) out.println("<script>alert('로그인 성공하였습니다.\\n메인페이지로 이동합니다.');location.href = 'main.jsp';</script>");
  else out.println("<script>alert('로그인 실패하였습니다.\\n로그인페이지로 이동합니다.');location.href = 'login.jsp';</script>");
 %>
