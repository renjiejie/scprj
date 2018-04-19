<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ page import="java.sql.*"
    import ="javax.servlet.*"
import="javax.servlet.http.*"
import= "java.io.*" %>
<!DOCTYPE html>
<!--[if lt IE 7]> <html class="lt-ie9 lt-ie8 lt-ie7" lang="zh"> <![endif]-->
<!--[if IE 7]>    <html class="lt-ie9 lt-ie8" lang="zh"> <![endif]-->
<!--[if IE 8]>    <html class="lt-ie9" lang="zh"> <![endif]-->
<!--[if gt IE 8]><!--> <html lang="zh"> <!--<![endif]-->
<head>
    <!-- META TAGS -->
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" >
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>帖子</title>

    <link rel="shortcut icon" href="images/favicon.png" />




    <!-- Style Sheet-->
    <link rel="stylesheet" href="style.css"/>
    <link rel='stylesheet' id='bootstrap-css-css'  href='css/bootstrap5152.css?ver=1.0' type='text/css' media='all' />
    <link rel='stylesheet' id='responsive-css-css'  href='css/responsive5152.css?ver=1.0' type='text/css' media='all' />
    <link rel='stylesheet' id='pretty-photo-css-css'  href='js/prettyphoto/prettyPhotoaeb9.css?ver=3.1.4' type='text/css' media='all' />
    <link rel='stylesheet' id='main-css-css'  href='css/main5152.css?ver=1.0' type='text/css' media='all' />
    <link rel='stylesheet' id='custom-css-css'  href='css/custom5152.html?ver=1.0' type='text/css' media='all' />


    <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
    <script src="js/html5.js"></script></script>
    <![endif]-->

</head>

<body>
<!-- Start of Header -->
<div class="header-wrapper">
    <header>
        <div class="container">




            <!-- Start of Main Navigation -->
            <nav class="main-nav">
                <div class="menu-top-menu-container">
                    <ul id="menu-top-menu" class="clearfix">
                        <li><a href="home-categories-articles.html">首页</a></li>
                    </ul>
                </div>
            </nav>
            <!-- End of Main Navigation -->

        </div>
    </header>
</div>
<!-- End of Header -->

<!-- Start of Search Wrapper -->
<div class="search-area-wrapper2">
  <div class="search-area container" align="center">
    <table width="1000" border="1">
    <%
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/hitclass","root","12345678");
Statement stmt = con.createStatement();
ResultSet ad = stmt.executeQuery("select * from text");
String id= null;
int pageID =0;
String speakerID = null;
String content = null;
while(ad.next()){
					id=ad.getString(1);
					pageID=ad.getInt(2);
					speakerID=ad.getString(3);
					content = ad.getString(4);
					if(pageID == 1)
					{
						
%>
      <tr>
        <td width="200"><%=speakerID %></td>
        <td width="800"><%=content %></td>
      </tr>
<%				}
						
				}
%>
    </table>
    <div>
      <form name="form1" method="post" action="">
        <label>
        <input type="text" name="speakerID">
        </label>
        <table width="226" border="1">
          <tr>
            <td width="168"><label>
              <input type="text" name="content">
            </label></td>
            <td width="42"><label>
              <input type="submit" name="Submit" value="提交">
            </label></td>
          </tr>
        </table>
      </form>
    </div>
    <p>&nbsp;</p>
  </div>
</div>

<a href="#top" id="scroll-top"></a>


<div style="display:none"><script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript' charset='UTF-8'></script></div>
</body>
</html>