<%@ page import="org.example.jspstudy.simpleboard.SimpleBoardDto" %>
<%@ page import="org.example.jspstudy.simpleboard.SimpleBoardDao" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="org.example.jspstudy.simpleboardanswer.SimpleAnswerDao" %>
<%@ page import="org.example.jspstudy.simpleboardanswer.SimpleAnswerDto" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<%
    String num = request.getParameter("num");
    SimpleBoardDao dao = new SimpleBoardDao();
    SimpleAnswerDao simpleAnswerDao = new SimpleAnswerDao();

    dao.updateReadCount(num);
    SimpleBoardDto dto = dao.getContent(num);
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");

    List<SimpleAnswerDto> list = simpleAnswerDao.getAnswerList(num);

%>
<head>
    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Dongle&family=Gaegu&family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@100..900&family=Noto+Serif+KR&display=swap"
          rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <title>Insert title here</title>
    <style>
        body * {
            font-size: 11pt;
            font-family: 'Noto Serif KR';
        }
        span.day {
            color: #ccc;
            font-size: 0.8em;

        }
        span.aday{
            float: right;
            font-size: 0.8em;
            color: #bbb;
        }

        div.alist{margin-left: 20px;}

        i.amod{
            margin-left: 20px;
            color: green;
        }

        i.adel{
            color: red;
        }
    </style>
    <script>
        $(function () {
            answerList();
            //ajax로 insert
            let num = $("#num").val();
            $("#btnsend").click(function (){
                let nickname = $("#nickname").val().trim();
                let content = $("#content").val().trim();

                if (nickname === '') {
                    alert("닉네임을 입력하세요");
                    return;
                }
                if (content === '') {
                    alert("댓글을 입력하세요");
                    return;
                }

                $.ajax({
                    type: "get",
                    data: {nickname: nickname, content: content},
                    url: "../simpleboardanswer/insertAnswer.jsp?num=" + num,
                    success:function (){
                        $("#nickname").val("");
                        $("#content").val("");
                        answerList();
                    }
                })

            });

            // 댓글 수정
            $(document).on("click","i.amod",function (){

                let nickname = $(this).siblings("b").text();
                let content = $(this).siblings("span").eq(0).text();
                let idx=$(this).attr("idx");

                let s = "";
                s += "<div class='input-group'>" +
                    "<input type='text' value='"+nickname+"' class='form-control' " +
                    "style='width: 80px;' >" +
                    "<input type='text' value='"+content+"' class='form-control'" +
                    "style='width: 300px;' >" +
                    "<button id='tempbtn"+idx+"' class='btn btn-primary btn-sm' type='button'>수정</button>" +
                    "</div>";

                $(this).parent().html(s);

                $(document).on("click", "#tempbtn"+idx, function() {
                    let nickname = $(this).siblings("input").eq(0).val();
                    let content = $(this).siblings("input").eq(1).val()
                    $.ajax({
                        type: "get",
                        data:{idx: idx,nickname: nickname,content:content},
                        url:"../simpleboardanswer/updateAnswer.jsp",
                        success:function (){
                            answerList();
                        }
                    })
                });
            })





            //댓글 삭제
            $(document).on("click","i.adel",function (){
                $.ajax({
                    type: "get",
                    data:{idx: $(this).attr("idx")},
                    url:"../simpleboardanswer/deleteAnswer.jsp",
                    success:function (){
                        answerList();
                    }
                })
            })

            $(document).on("mouseover","i.adel, i.amod",function(){
                $(this).css("border", "1px solid black");
            });
            $(document).on("mouseout", "i.adel, i.amod", function(){
                $(this).css("border", "none");
            });

        });

        function answerList(){
            $.ajax({
                type: "get",
                dataType: "json",
                data: {num: $("#num").val()},
                url: "../simpleboardanswer/listAnswer.jsp",
                success: function (res) {
                    let s = "";

                    $.each(res,function(idx,item){

                        s+="<div><b>"+item.nickname+"</b>:  <span>"+item.content+"</span>";
                        s+="<span class='aday'>"+item.writeday+"</span>";
                        s+="<i class='bi bi-pencil-square amod' idx='"+item.idx+"'></i>";
                        s+="<i class='bi bi-trash adel' idx='"+item.idx+"'></i></div>";
                    });
                    $("div.alist").html(s);
                }
            });
        }


    </script>
</head>

<body>
<input id="num" hidden value="<%=num%>">
<div style="margin: 50px 100px; width: 500px">
    <table class="table table-bordered">
        <caption align="top"><b style="font-size:15pt"><%=dto.getSubject()%></b></caption>
        <tr>
            <td>
                <b>작성자:<%=dto.getWriter()%></b><br>
                <span><%=sdf.format(dto.getWriteday())%></span>
                &nbsp;&nbsp;&nbsp;&nbsp;조회:<%=dto.getReadcount()%>
            </td>
        </tr>
        <tr>
            <td>
                <%=dto.getContent().replace("\n","<br>")%>
            </td>
        </tr>

        <!-- 댓글 -->
        <tr>
            <td>
                <b class="acount">댓글<span>&nbsp;<%=list.size()%></span></b>
                <div class="alist">
                    댓글목록
                </div>
                <div class="aform input-group">
                    <input type="text" id="nickname" class="form-control"
                           style="width: 80px;" placeholder="닉네임">
                    <input type="text" id="content" class="form-control"
                           style="width: 300px; margin-left: 10px;" placeholder="댓글메세지">

                    <button type="button" id="btnsend"
                            class="btn btn-info btn-sm" style="margin-left: 10px;">저장</button>
                </div>
            </td>
        </tr>



        <tr>
            <td align="center">
                <button type="button" class="btn btn-outline-info" onclick="location.href='addform.jsp'">
                    <i class="bi bi-pencil-square"></i>글쓰기</button>

                <button type="button" class="btn btn-outline-success" onclick="location.href='boardlist.jsp'">
                    <i class="bi bi-list-check"></i>목록</button>

                <button type="button" class="btn btn-outline-primary" onclick="location.href='updatepassform.jsp?num=<%=dto.getNum()%>'">
                    <i class="bi bi-pencil-square"></i>수정</button>

                <button type="button" class="btn btn-outline-danger" onclick="location.href='deletepassform.jsp?num=<%=dto.getNum()%>'">
                    <i class="bi bi-trash3"></i>삭제</button>

            </td>
        </tr>

    </table>

</div>
</body>
</html>