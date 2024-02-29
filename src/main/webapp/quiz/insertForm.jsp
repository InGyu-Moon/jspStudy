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
<div style="margin: 50px 100px;">
    <form action="insertAction.jsp" method="post">
        <table class="table table-bordered" style="width: 350px;">

            <tr>
                <th class="table-success" width="100">이름</th>
                <td>
                    <input type="text" name="name" placeholder="이름"
                           required="required" class="form-control" style="width: 120px;">
                </td>
            </tr>

            <tr>
                <th class="table-success" width="100">나이</th>
                <td>
                    <input type="number"  name="age" min="0" max="120" step="1"
                           required="required" class="form-control" style="width: 60px;display: inline-block;" >&nbsp;살
                </td>
            </tr>

            <tr>
                <th class="table-success" width="100">핸드폰</th>
                <td>
                    <input type="text" name="phone" placeholder="010-1234-5678"
                           required="required" class="form-control" style="width: 200px;">
                </td>
            </tr>

            <tr>
                <th class="table-success" width="100">운전면허</th>
                <td>
                    면허&nbsp;유무&nbsp;<input type="checkbox" name="licence">
                </td>
            </tr>

            <tr>
                <td colspan="2" align="center">
                    <input type="submit" value="전송" class="btn btn-outline-success">
                    <input type="button" value="목록" class="btn btn-outline-warning"
                           onclick="location.href='list.jsp'">
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>