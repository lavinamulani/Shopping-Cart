

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.util.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="styles/stylesheet.css">
        <script type="text/javascript" src="scripts/jquery.js">
            </script>
            <script type="text/javascript" src="scripts/showitems.js?v=1"></script>
        <title>Store Items</title>
    </head>
    <body>
        
        <%@include file="logo.html"  %>
        <%
             String username=(String)session.getAttribute("username");
           
           
            if(username==null)
            {
                session.invalidate();
                response.sendRedirect("accessdenied.html");
            }
            else
            {
                StringBuffer displayBlock=new StringBuffer("<br<br><br><br><br><br><br><br><br><br><div class='see-store' ><h1 style='font-family:serif;color:limegreen;'>CATEGORIES</h1><hr style='width:120px;'><p style='font-size:18px;color:white;'>Select a category to see its items.</p>");
               // System.out.println(displayBlock);
                List<String> itemList=(List<String>)request.getAttribute("category");
                for(String itemType:itemList)
                {
                    displayBlock.append("<p id='"+itemType+"'><strong><a href='#' class='see-store-categories' style='color:limegreen;' onclick=getItemNames('"+itemType+"')><span>+"+itemType+"</span></a></strong></p>");
                    
                }
                
                displayBlock.append("</div>");
                displayBlock.append("<h4 id='logout'><button style='height:30px;background-color:black;text-align:center;'><a href='myorders.jsp' style='color:cyan;'>My Orders</a>&nbsp;&nbsp;&nbsp;<button style='margin-left:20px;height:30px;background-color:black;text-align:center;'><a href='LoginControllerServlet?logout=logout' style='color:cyan;'>Logout</a></h4>");
                out.println(displayBlock);
            }
        %>
    </body>
</html>
