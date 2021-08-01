<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.article.model.*"%>
<%@ page import="com.article_type.model.*"%>

<%ArtVO artVO = (ArtVO) request.getAttribute("artVO");%>

<%
    ArttService arttSvc = new ArttService();
    ArttVO arttVO = arttSvc.getOneByID(artVO.getArtt_id());
%> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>後台_知識站單一查詢資料</title>

    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/hidden_menu.css"> 
  	<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/hidden_menu2.css"> 

  <style>
  h3 {
    text-align:center;
    
   }

   .table1 {
  margin-top: 50px;
  border-collapse: collapse;
  width: 100%;
  font-family:"Lucida Console", "Courier New", monospace;
 max-width:1100px;
  margin-left: auto;
  margin-right: auto;
  padding-top: 0;
  color: black;
}
 .table1 th {
  padding-top: 20px;
  padding-bottom: 12px;
  text-align: left;
  background-color: #D2AD86;   /* 藍色  #008CBA; */
  text-align:center; 
  margin-left: auto; 
  margin-right: auto ;
  font-size:20px;
  color: white;
}

tr:hover {
  background-color:LightGray;
}

th, td {
  padding: 8px;
  text-align:center;
/*   text-align: left; */
  border-bottom: 1px solid #ddd;
}
.button {
    background-color: white; 
    color: black; 
    border: 2px solid #D2AD86;
   border-radius: 12px;
    width: 80px;
    height: 50px;
    font-size:15px;
}

  .button:hover {
    background-color: #D2AD86; /* Green */
    color: white;
}

 .btn:hover {
      	background: #ffe6c7;
      	color: #fff;
   }
   a.btsp{
		font-size: 35px;
		color: #e8c497;
		font-weight: bold;
		margin-left: 100px;
	}
	a.btsp:hover, a.btsp:active{
		color: #ffe6c7;
		text-decoration: none;
	}
	p.allitemtitle{
		color:#fff;
		font-weight: bold;
	}
</style>


</head>
<body>

<!-- 以下為header ******************************************************************************************* -->

 <header>
    <span class="toggle-button" style="margin-left:-5px;margin-top:-7px;">
        <div class="menu-bar menu-bar-top"></div>
        <div class="menu-bar menu-bar-middle"></div>
        <div class="menu-bar menu-bar-bottom"></div>
    </span>
    <div class="menu-wrap">
        <div class="menu-sidebar" style="margin-top:30px;">
            <ul class="menu">
                <li><a href="<%= request.getContextPath() %>/back-end/member/listAllMember.jsp">會員資料管理</a></li>
                <li><a href="<%= request.getContextPath() %>/back-end/item/itemHomePage.jsp">商城管理</a></li>
                <li><a href="<%= request.getContextPath() %>/front-end/message/addMessage.jsp">商城客服管理</a></li>
                <li><a href="<%= request.getContextPath() %>/back-end/forumpost/forumPostHomePage.jsp">討論區管理</a></li>
                <li><a href="<%= request.getContextPath() %>/front-end/adopt/adopt_home.jsp">浪浪找家管理</a></li>
                <li><a href="<%= request.getContextPath() %>/back-end/article/select_page_art.jsp">知識站管理</a></li>
                <li><a href="<%= request.getContextPath() %>/back-end/announcemet/select_page.jsp">公告管理</a></li>
                <li><a href="<%= request.getContextPath() %>/back-end/groomer/groomerList.jsp">美容師管理</a></li>
                <li><a href="<%= request.getContextPath() %>/back-end/groomer/grooming_report.jsp">美容預約檢舉管理</a></li>
            </ul>
        </div>
    </div>
</header>

<!--以上為header ***********************************************************************-->

 <!-- 以下範圍為最上方包著商城管理以及右方後台人員的區塊, -->
                <nav class="navbar navbar-light navbar-expand bg-white mb-4 topbar static-top">
                    <div class="container-fluid" style="margin-top:23px;margin-left:-6px;">
<!--請看這行最右邊-->  <a class="btsp" href="<%=request.getContextPath()%>/back-end/article/select_page_art.jsp">知識站管理</a>  <!-- 這行是商城管理的標題，可以自行設定，還有href可以自行設定跳轉的頁面 -->
                       	 <ul class="nav navbar-nav flex-nowrap ml-auto" style="margin-top:-10px;">                         
                           
                            <li class="nav-item dropdown no-arrow" style="margin-top:10px">
                                <div class="nav-item dropdown no-arrow"><a class="dropdown-toggle nav-link" data-toggle="dropdown" aria-expanded="false" href="#">
                                	<span class="backperson" style="font-size:15px;font-weight:700;margin-right:5px;">後台人員</span>
                                	<img class="border rounded-circle img-profile" style="widht:40px;height:40px;margin-top:-5px;" src="<%=request.getContextPath()%>/resources/images/items/MaoUniICON.png"></a>
                                    <div class="dropdown-menu dropdown-menu-right animated--grow-in">
                                    	<a class="dropdown-item" href="#" style="font-weight:700;color:#646464;">Logout</a>
                                    </div>
	                   			</div>
	                    	</li>
	                    </ul>
	            	</div>
	            </nav>
<!-- 以上範圍為最上方包著商城管理以及右方後台人員的區塊, --> 

  <table class="table1">
     <tr>
		<th>文章圖片</th>
        <th>文章編號</th>
        <th>文章分類</th>
        <th>文章名稱</th>
        <th>文章內容</th>
        <th>發布時間</th>
	</tr>
	<tr>
	    <td>
	       <img src="<%=request.getContextPath()%>/ArtImgServlet?id=${artVO.getId()}" 
			         width="180" height="150"></td>
        <td><%=artVO.getId()%></td>
        <td><%=artVO.getArtt_id()%>【<%=arttVO.getName()%>】</td>
        <td><%=artVO.getName()%></td>
        <td><%=artVO.getContnt()%></td>
        <td><%=artVO.getUpdate()%></td>
	</tr>
  </table>
  
  <!-- 以下為boostrap靜態檔引入,不可少!!! 路徑錯了會跑版-->
    <script src="<%=request.getContextPath()%>/resources/js/jquery.min.js"></script> 
    <script src="<%=request.getContextPath()%>/resources/js/bootstrap.min.js"></script>
 <!-- 以下為隱藏式菜單連結(JSP)--> 
    <script src="<%=request.getContextPath()%>/resources/js/hidden_menu3.js"></script> 
    <script src="<%=request.getContextPath()%>/resources/js/hidden_menu4.js"></script>
  
</body>
</html>