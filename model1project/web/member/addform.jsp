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
        $(function(){
            $("#btnIdCheck").click(function (){
                let id = $("#id").val();
                // let id = $(this).siblings("input").val();
                $.ajax({
                    type: "get",
                    url: "member/idCheck.jsp",
                    data: {"id": id},
                    dataType: "json",
                    success:function (data){
                        if(data.count===1){
                            // alert("가입불가");
                            $("span.idsuccess").text("not ok!!");
                        }else{
                            // alert("가입가능");
                            $("span.idsuccess").text("ok!!");
                        }
                    }
                })
            })

            $("#selEmail").change(function (){
                let email = $(this).val();
                $("#email2").val(email);
            })
        })

        function check(f) {
            if (f.pass.value !== f.pass2.value) {
                alert("비밀번호가 다름");
                f.pass.value = "";
                f.pass2.value = "";
                return false; // action 호출x
            }
        }


    </script>
</head>
<body>
<div style="margin: 100px 100px; width: 500px;">
    <!-- member/addaction.jsp -->
    <form action="member/addaction.jsp" method="post" onsubmit="return check(this)">
        <table class="table table-bordered" style="width: 500px;">
            <caption align="top"><b>회원가입</b></caption>
            <tr>
                <th width="100" class="table-success">아이디</th>
                <td>
                    <div class="d-inline-flex">
                        <input type="text" name="id" id="id" maxlength="8" class="form-control" required style="width: 120px;">
                        <button type="button" class="btn btn-danger" id="btnIdCheck" style="margin-left: 10px">중복체크</button>
                        <span style="color: blue; margin-left: 10px" class="idsuccess"></span>
                    </div>
                </td>
            </tr>
            <tr>
                <th width="100" class="table-success">비밀번호</th>
                <td>
                    <div class="d-inline-flex">
                        <input type="password" name="pass" placeholder="비밀번호" class="form-control" required style="width: 130px;margin-left: 10px">
                        <input type="password" name="pass2" placeholder="비밀번호 확인" class="form-control" required style="width: 130px;">
                    </div>
                </td>
            </tr>

            <tr>
                <th width="100" class="table-success">이름</th>
                <td>
                    <input type="text" name="name" class="form-control" required style="width: 120px;">
                </td>
            </tr>
            <tr>
                <th width="100" class="table-success">핸드폰</th>
                <td>
                    <input type="text" name="hp" class="form-control" required style="width: 180px;">
                </td>
            </tr>
            <tr>
                <th width="100" class="table-success">주소</th>
                <td>
                    <input type="text" name="addr" class="form-control" required style="width: 330px;">
                </td>
            </tr>
            <tr>
                <th width="100" class="table-success">이메일</th>
                <td>
                    <div class="d-inline-flex">
                        <input type="text" name="email" class="form-control" required style="width: 120px;">
                        <b style="margin-left: 10px;margin-right: 10px"> @ </b>
                        <input type="text" name="email2" id="email2" class="form-control" required style="width: 120px;">
                        <select id="selEmail" class="form-control">
                            <option value="">직접입력</option>
                            <option value="naver.com">네이버</option>
                            <option value="gmail.com">구글</option>
                            <option value="nate.com">네이트</option>
                            <option value="daum.net">다음</option>
                        </select>
                    </div>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <button type="submit" class="btn btn-outline-info" style="width: 100px;">저장하기</button>
                    <button type="reset" class="btn btn-outline-info" style="width: 100px;">초기화</button>
                </td>
            </tr>

        </table>
    </form>
</div>
</body>
</html>