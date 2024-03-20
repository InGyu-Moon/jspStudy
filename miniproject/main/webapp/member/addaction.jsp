<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%
    request.setCharacterEncoding("utf-8");
    String email = request.getParameter("email") + "@" + request.getParameter("email2");
%>
<jsp:useBean id="dto" class="org.example.model1miniproject.data.dto.MemberDto"/>
<jsp:useBean id="dao" class="org.example.model1miniproject.data.dao.MemberDao"/>
<jsp:setProperty name="dto" property="*"/>

<%
    dto.setEmail(email);
    dao.insertMember(dto);

    response.sendRedirect("../index.jsp?main=member/memberlist.jsp");
%>