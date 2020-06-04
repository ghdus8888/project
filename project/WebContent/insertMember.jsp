<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "project.LogonDBBean" %>
<%@ page import="project.LogonDataBean" %>
<script src="js/jquery.min.js"></script>

<%

  request.setCharacterEncoding("utf-8");
  LogonDataBean vo = new LogonDataBean();
  vo.setId(request.getParameter("id"));
  vo.setPasswd(request.getParameter("passwd"));
  vo.setName(request.getParameter("name"));
  vo.setTel(request.getParameter("tel"));
  LogonDBBean manager = LogonDBBean.getInstance();
  int result = manager.insertMember(vo);
  if (result == 1) out.println("<script>alert('회원가입 성공하였습니다.\\n메인페이지로 이동합니다.');location.href = 'main.jsp';</script>");
  else out.println("<script>alert('회원가입 실패하였습니다.\\n회원가입 페이지로 이동합니다.');location.href = 'join.jsp';</script>");
 %>
