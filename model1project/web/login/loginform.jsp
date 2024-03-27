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
</head>
<body>
<%
    //세션값 얻기
    String saveok=(String)session.getAttribute("saveok");
    String myid="";
    if(saveok!=null){
        myid=(String)session.getAttribute("myid");
    }
%>
<div style="margin: 200px 200px">
    <form action="/login/loginaction.jsp" method="post">
        <table class="table table-bordered" style="width: 200px">
            <caption align="top"><b>세션로그인</b></caption>
            <tr>
                <td>
                    <input type="text" name="id" class="form-control" required placeholder="아이디 입력" width="200"  value="<%=myid%>">
                </td>
            </tr>
            <tr>
                <td>
                    <input type="password" name="pass" class="form-control" required placeholder="패스워드 입력" width="200">
                </td>
            </tr>
            <tr>
                <td>
                    <input type="checkbox" name="cbsave" >&nbsp;아이디저장
                </td>
            </tr>
            <tr>
                <td>
                    <button type="submit" class="btn btn-success btn-lg">로그인</button>
                </td>
            </tr>

        </table>
    </form>
</div>
</body>
</html>