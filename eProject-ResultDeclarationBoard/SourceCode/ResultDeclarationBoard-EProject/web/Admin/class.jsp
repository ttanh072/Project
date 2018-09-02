<%-- 
    Document   : index
    Created on : Feb 15, 2015, 3:33:41 PM
    Author     : DELL
--%>
<%
    if (request.getSession().getAttribute("login") == null) {
        response.sendRedirect("login.jsp?returnUrl=class.jsp");
       } else if (request.getSession().getAttribute("lockscreen") != "UN") {
        response.sendRedirect("lock_screen.jsp?returnUrl=class.jsp");
    } else {%>
<%@page import="java.util.Collection"%>
<%@page import="java.util.Collection"%>
<%@page import="beans.BClass"%>
<%@page import="org.apache.taglibs.standard.tag.common.sql.ResultImpl"%>
<!DOCTYPE html>


<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="/WEB-INF/taglib139.tld" prefix="pg" %>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="Dashboard">
        <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

        <title>KINGSTONE ACADEMIC - Class Manage</title>

        <script>
            function confirmGo(m, u) {
                if (confirm(m)) {
                    window.location = u;
                }
            }
        </script>
        <!-- Bootstrap core CSS -->
        <link href="assets/css/bootstrap.css" rel="stylesheet">
        <!--external css-->
        <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
        <link rel="stylesheet" type="text/css" href="assets/css/zabuto_calendar.css">
        <link rel="stylesheet" type="text/css" href="assets/js/gritter/css/jquery.gritter.css" />
        <link rel="stylesheet" type="text/css" href="assets/lineicons/style.css">    

        <!-- Custom styles for this template -->
        <link href="assets/css/style.css" rel="stylesheet">
        <link href="assets/css/style-responsive.css" rel="stylesheet">

        <script src="assets/js/chart-master/Chart.js"></script>


        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
          <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>

    <body>
        <c:set var="pageSize" value="7" scope="session"/>
        <c:set var="currentPage" value="1" scope="session"/>
        <c:if test="${not empty param.page}">
            <c:set var="currentPage" value="${param.page}" scope="session"/>
        </c:if>
        <%
            BClass ojb = new BClass();
            Collection kq = ojb.getAllclassjoinlist();
            request.setAttribute("class", kq);
        %>
        <!-- **********************************************************************************************************************************************************
        TOP BAR CONTENT & NOTIFICATIONS
        *********************************************************************************************************************************************************** -->
        <!--header start-->
        <jsp:include page="header.jsp"/>
        <!--header end-->

        <section id="main-content">
            <section class="wrapper">
                <h3><i class="fa fa-angle-right"></i> Class Manage </h3>




                <div class="row mt">
                    <div class="col-md-12">
                        <div class="content-panel">
                            <table class="table table-striped table-advance table-hover">
                                <form action="classA.jsp">
                                    <button class="btn btn-success btn-xs"><i class="fa fa-angle-right" class="fa fa-check"></i> Add new</button>
                                </form>
                                <hr>
                                <thead>
                                    <tr>
                                        <th><i class="fa fa-bullhorn"></i> Id</th>
                                        <th><i class="fa fa-bullhorn"></i> Name</th>
                                        <th><i class=" fa fa-edit"></i> Curriculum</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:set var="count" value="0"/>
                                    <pg:paging pageSize="10" url="class.jsp"> 
                                        <c:forEach var="row" items="${class}">
                                            <pg:item> 
                                                <tr>
                                                    <td><c:out value="${row.cla_Id}"/></td> 
                                                    <td><c:out value="${row.cla_Name}"/></td> 
                                                    <td><c:out value="${row.cur_Name}"/></td> 
                                                    <c:url var="edit" value="../CClass">
                                                        <c:param name="btn" value="Edit" />
                                                        <c:param name="eclassID" value="${row.cla_Id}" />
                                                        <c:param name="eclassname" value="${row.cla_Name}" />
                                                        <c:param name="eclacurid" value="${row.cur_Id}" />
                                                        <c:param name="p" value="${param.pageNum}"/> 
                                                    </c:url> 
                                                    <c:url var="delete" value="../CClass">
                                                        <c:param name="btn" value="Delete" />
                                                        <c:param name="claid" value="${row.cla_Id}" />                                                
                                                        <c:param name="p" value="${param.pageNum}"/> 
                                                    </c:url>
                                                    <td>
                                                        <a href="${edit}" class="btn btn-primary btn-xs"><i class="fa fa-pencil"></i></a>
                                                        <a href="${delete}" onclick="return confirmGo('Do you really want to delete this records ?')" class="btn btn-danger btn-xs"><i class="fa fa-trash-o "></i></a>
                                                    </td>
                                                </tr>
                                            </pg:item> 
                                        </c:forEach>
                                        <pg:index>
                                        <ul class="controls-buttons">


                                            <li><pg:page><b><%=thisPage%></b></pg:page></li>
                                            <li><pg:firstPage><img src="images/icons/fugue/navigation-180.png" width="16" height="16"><b> [  Previous   ]</pg:firstPage></li>
                                            <li><pg:lastPage>[  Next  ] <img src="images/icons/fugue/navigation.png" width="16" height="16"></pg:lastPage></li>

                                            </ul>

                                    </pg:index> 

                                </pg:paging> 			

                                </tbody>
                            </table>
                        </div><!-- /content-panel -->
                    </div><!-- /col-md-12 -->
                </div><!-- /row -->

            </section><! --/wrapper -->
        </section>
        <!-- /MAIN CONTENT -->


        <!--main content end-->
        <!--footer start-->
        <jsp:include page="footer.jsp"/>
        <!--footer end-->
    </section>



</body>
</html>
<%}%>