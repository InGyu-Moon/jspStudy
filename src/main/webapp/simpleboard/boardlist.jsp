<%@ page import="org.example.jspstudy.simpleboard.SimpleBoardDao" %>
<%@ page import="org.example.jspstudy.simpleboard.SimpleBoardDto" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css" rel="stylesheet">

    <link href="https://fonts.googleapis.com/css2?family=Dongle&family=Gaegu&family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@100..900&family=Noto+Serif+KR&display=swap"
          rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <title>Insert title here</title>

    <style>
        a:link,a:visited {
            text-decoration: none;
            color: black;
        }
        a:hover{
            text-decoration: underline;
            color: gray;
        }
        body * {
            font-size: 11pt;
            font-family: 'Noto Serif KR';
        }
    </style>





</head>
<%
    SimpleBoardDao dao = new SimpleBoardDao();
//    List<SimpleBoardDto> list = dao.getAllDatas();
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");

    int totalCount = dao.getTotalCount();
    int perPage = 3; //한페이지당 보여질 글의 수
    int perBlock = 5; // 한블럭당 페이지의 개수

    int startNum; // db에서 가저올 글의 시작번호 mysql = 0, oracle = 1
    int startPage; // 각 블럭당 보여질 시작 페이지
    int endPage; // 각 블럭당 보여질 끝 페이지
    int currentPage; // 현재페이지
    int totalPage; // 전체 페이지
    int no; // 각 페이지당 출력할 시작번호

    // 현재페이지 읽는데 단 null일 경우는 1페이지로 줌
    if (request.getParameter("currentPage") == null) {
        currentPage = 1;
    }
    else{
        currentPage = Integer.parseInt(request.getParameter("currentPage"));
    }
    //총페이지수를 구한다
    totalPage = totalCount / perPage + (totalCount % perPage == 0 ? 0 : 1);

    //각블럭당 보여질 첫 게시글의 번호
    // perBlock=5일 경우 현재페이지가 1~5일경우 시작페이지:1, 끝페이지:5
    // 현재 페이지가 13일 경우 시작:11, 끝:15
    startPage = (currentPage - 1) / perBlock * perBlock + 1;
    endPage = startPage + perBlock - 1;

    if(endPage>totalPage)
        endPage = totalPage;

    //각페이지에서 보여질 시작번호
    // 1페이지:0, 2페이지:5, 3페이지:10
    startNum = (currentPage - 1) * perPage;

    //각 페이지당 출력할 시작번호
    // 총 글의 수가 23, 1페이지:23, 2페이지:18, 3페이지:13
    no = totalCount - (currentPage - 1) * perPage;

    //페이지에서 보여질 글만 가져오기
    List<SimpleBoardDto> list = dao.getPagingList(startNum, perPage);




%>
<body>
<div style="margin: 50px 100px; width: 800px">
    <button type="button" class="btn btn-outline-info" onclick="location.href='addform.jsp'" style="margin-left: 550px;">
        <i class="bi bi-pencil-fill"></i>
        글쓰기
    </button>
    <br>
    <h6><b>총 <%=totalCount%>개의 글이 있습니다</b></h6>
    <table class="table table-bordered">
        <caption align="top"><b>간단 목록 게시판</b></caption>
        <tr class="table-light">
            <th width="80">번호</th>
            <th width="350">제목</th>
            <th width="180">작성자</th>
            <th width="180">작성일</th>
            <th width="100">조회</th>
        </tr>
        <%
            if(list.isEmpty())
            {%>
                <tr>
                    <td colspan="5" align="center">
                        <h6><b>등록된 게시물이 없습니다</b></h6>
                    </td>
                </tr>

            <%}else{
                for(int i=0;i< list.size();i++){
                    SimpleBoardDto dto = list.get(i);
                    %>
                    <tr>
                        <td align="center"><%=no--%></td>
                        <td>
                            <a href="contentview.jsp?num=<%=dto.getNum()%>"><%=dto.getSubject()%></a>

                        </td>
                        <td align="center"><%=dto.getWriter()%></td>
                        <td align="center"><%=sdf.format(dto.getWriteday())%></td>
                        <td align="center"><%=dto.getReadcount()%></td>
                    </tr>
                <%}
            }
        %>

    </table>

    <!-- 페이지 번호 출력 -->
    <ul class="pagination justify-content-center">
        <%
            //이전
            if(startPage>1)
            {%>
        <li class="page-item ">
            <a class="page-link" href="boardlist.jsp?currentPage=<%=startPage-1%>" style="color: black;">이전</a>
        </li>
        <%}
            for(int pp=startPage;pp<=endPage;pp++)
            {
                if(pp==currentPage)
                {%>
        <li class="page-item active">
            <a class="page-link" href="boardlist.jsp?currentPage=<%=pp%>"><%=pp %></a>
        </li>
        <%}else
        {%>
        <li class="page-item">
            <a class="page-link" href="boardlist.jsp?currentPage=<%=pp%>"><%=pp %></a>
        </li>
        <%}
        }

            //다음
            if(endPage<totalPage)
            {%>
        <li class="page-item">
            <a  class="page-link" href="boardlist.jsp?currentPage=<%=endPage+1%>"
                style="color: black;">다음</a>
        </li>
        <%}
        %>

    </ul>




</div>
</body>
</html>