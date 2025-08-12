<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키저장</title>
</head>
<body>
	<%
		// request로부터 "riize_Anton" 파라미터 값 가져오기
		String riize_Anton = request.getParameter("riize_Anton");
		String riize_Anton_count = request.getParameter("riize_Anton_count");
		String riize_sohee = request.getParameter("riize_sohee");
		String riize_sohee_count = request.getParameter("riize_sohee_count");
		
	    // request에 "product"라는 파라미터가 있는지 확인
	    if (request.getParameter("product") != null) {
	    	// 4개 쿠키객체선언
	    	Cookie cookie = new Cookie("riize_Anton",riize_Anton);
	    	Cookie cookie2 = new Cookie("riize_Anton_count",riize_Anton_count);
	    	Cookie cookie3 = new Cookie("riize_sohee",riize_sohee);
	    	Cookie cookie4 = new Cookie("riize_sohee_count",riize_sohee_count);
	    	// 쿠키시간설정 (유효시간-10분(60초*10))
	    	cookie.setMaxAge(60*10);
	    	cookie2.setMaxAge(60*10);
	    	cookie3.setMaxAge(60*10);
	    	cookie4.setMaxAge(60*10);
	    	// 쿠키저장 (클라이언트 브라우저로 전송)
	    	response.addCookie(cookie);
	    	response.addCookie(cookie2);
	    	response.addCookie(cookie3);
	    	response.addCookie(cookie4);
	    }else{
	    	// 4개 쿠키삭제 (// "product" 파라미터가 없으면 => 모든 쿠키 삭제 처리)
	    	Cookie[] cookies = request.getCookies();
	    	for (Cookie cookie:cookies){
	    		cookie.setMaxAge(0);
	    		response.addCookie(cookie);
	    	}
	    }
		response.sendRedirect("./product_list.jsp");		
	%>


</body>
</html>