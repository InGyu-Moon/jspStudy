<%@ page import="org.example.jspajaxproject.memberjoin.model.MemberJoinDao" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Dongle&family=Gaegu&family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@100..900&family=Noto+Serif+KR&display=swap" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <title>Insert title here</title>
    <script>
        function saveId(id){
            // alert(id);
            //부모창: opener
            opener.mfrm.m_id.value = id;
            window.close();
        }

    </script>
</head>
<body>
<%
    String key=request.getParameter("key"); //처음호출시 null값
    if(key==null){
        //널값일때는 폼을 나타내고
%>
<div style="margin: 10px 30px;">
    <form action="idSearch.jsp" method="post">
        <b>아이디를 입력해주세요</b><br>
        <div class="d-inline-flex">
            <input type="text" name="m_id" class="form-control" style="width: 130px;"
                   required="required" placeholder="아이디 입력">
            <input type="hidden" name="key" value="yes">
            <button type="submit" class="btn btn-success" style="margin-left: 10px;">중복체크</button>
        </div>
    </form>
</div>
<%}else{
        // 액션 처리
    String m_id = request.getParameter("m_id");
    // dao 선언후 아이디가 db에 존재하는지 확인
    MemberJoinDao dao = new MemberJoinDao();
    boolean b = dao.isIdCheck(m_id);
    if (b) {%>
        <div style="margin: 50px 50px">
            <h5><%=m_id%>는 이미 가입된 아이디 입니다.</h5>
            <img alt="" src="../image/jquery_img/image_01.png" width="60" align="left">
            <button type="button" class="btn btn-danger" onclick="location.href='idSearch.jsp'">다시입력</button>
        </div>
<%}else{%>
<div style="margin: 50px 50px">
    <h5><%=m_id%>는사용 가능한 아이디 입니다.</h5>
    <img alt="" src="../image/jquery_img/image_03.png" width="60" align="left">
    <button type="button" class="btn btn-danger" onclick="saveId('<%=m_id%>')">적용하기</button>
    <button type="button" class="btn btn-danger" onclick="location.href='idSearch.jsp'">다시입력</button>
</div>
<%
        }
}
%>
</body>
</html>