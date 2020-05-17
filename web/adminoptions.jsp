

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.util.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="styles/stylesheet.css"> 
        <script type="text/javascript" src="scripts/jquery.js">
         </script>
        <script type="text/javascript" src="scripts/ShowOptions.js"></script>
         
        <title>Store Items</title>
    </head>
    <body>
        <%@include file="logo.html"%>
        <%
          String username=(String)session.getAttribute("username");
          System.out.println("inside adminoptions username is "+username);
          if(username==null)
          {
             response.sendRedirect("accessdenied.html");
                      
          }
          else
          {
              
              StringBuffer displayBlock=new StringBuffer("</br></br></br><div class='admin-option' ><h1 style='font-family:serif;color:limegreen;'>ADMIN OPTIONS</h1><hr style='width:120px;'><p style='font-size:18px;color:white;'>Select a category to take an action.</p>");
          
              displayBlock.append("<div id='productcontainer' style='float:right;padding-right: 700px;border=solid 2px'></div>");
              
              String[]options=new String[]{"Products","Users","View"};
              for(String option: options){
                  displayBlock.append("<div style='text-align:center;'><p id='"+option+"'><strong><a href='#' class='admin-sub' style='color:limegreen;' onclick=getItemNames('"+option+"')><span>+"+option+"</span></strong></a></p></div>");
                   
              }
              
              displayBlock.append("</div>");
              System.out.println("final to client");
               System.out.println(displayBlock);
               displayBlock.append("<h4 id='logout'><button style='height:30px;background-color:black;text-align:center;'><a href='LoginControllerServlet?logout=logout' style='color:cyan;'>LOGOUT</a></h4>");
              out.println(displayBlock);
          }
        %>
    </body>
</html>
