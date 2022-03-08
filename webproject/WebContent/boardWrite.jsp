<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "Board.*" %>

<% 
	Board board = new Board();

	String board_type = request.getParameter("board_type");
	
	//게시판명
	String board_name = board.getBoardName(board_type);
	
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title><%=board_name %> - 함께해서 즐거운 게임 세상!</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<link rel="stylesheet" type="text/css" href="css/menu.css">
	<link rel="stylesheet" type="text/css" href="css/board.css">
</head>
<body>
	<%@ include file="Top.jsp" %>
	
	<%
	if(id == null){
		out.println("<script>");
	   out.println("alert('로그인 후 이용해주세요.')");
	   out.println("location.href='Login.jsp'");
	   out.println("</script>");
	}
	%>
  
  	<section id="main">
		<form action="boardProcess.jsp" method="post" name="boardForm" enctype="Multipart/form-data">
			<input type="hidden" name="board_type" value="<%=request.getParameter("board_type")%>" readonly/>
			<input type="hidden" name="board_id" value="<%=id %>" readonly />
			<div class="board">
				<table>
					<tr>
						<th>작성자</th>
						<td><%=id %></td>
					</tr>
					<tr> 
						<th>비밀글</th>
						<td><input type="checkbox" name="board_secret" value="1" /></td>
					</tr>
					<tr> 
						<th>제목</th>
						<td><input type="text" name="board_title" value="" /></td>
					</tr>
					<tr>
						<th>내용</th>
						<td><textarea rows="10" name="board_content"></textarea></td>
					</tr>
					<tr>
						<th>업로드파일</th>
						<td><input type="file" name="board_file" value="" /></td>
					</tr>
				</table>	
			</div>
			<div class="board_btn">
				<a href="javascript:form_action()">작성</a>
				<a href="javascript:history.back()">취소</a>
			</div>
		</form>
	</section>
</body>

<script>
	function form_action(){
	   var delConfirm = confirm('저장하시겠습니까?');
	   if (delConfirm) {
		   document.boardForm.submit();
	   }else{
		   return false;
	   }
	}
</script>
</html>