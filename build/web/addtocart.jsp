
<%@page contentType="text/html" pageEncoding="UTF-8" import="shoppingcatalogue.dto.ItemDTO,shoppingcatalogue.dao.StoreDAO,java.util.*"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="styles/stylesheet.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add To Cart Page</title>
    </head>
    <body>
        <%@include file='logo.html' %>
       <%
          String username=(String)session.getAttribute("username");
          if(username==null)
          {
              session.invalidate();
              response.sendRedirect("accessdenied.html");
          }
          else
          {
          int itemid=Integer.parseInt((String)request.getParameter("itemId"));
          ItemDTO item=StoreDAO.getItemDetails(itemid);
          session.setAttribute(String.valueOf(item.getItemId()), item);
          StringBuffer displayBlock=new StringBuffer("<br><br><br><br><h1></h1>");
          displayBlock.append("<div style='float:left;background:rgba(0,0,0,0.9);padding-top:20px;padding-bottom:20px;text-align:center;width:420px;border: solid 4px limegreen;border-radius:10px;'>");
          displayBlock.append("<p style='color:white;'><strong style='color:limegreen;font-size:30px;'>Item Added Successfully!</strong><hr style='width:120px;'</p>");
          displayBlock.append("<p style='color:white;'><strong style='color:limegreen;'>Item Id:</strong>"+item.getItemId()+"</p>");
          displayBlock.append("<p style='color:white;'><strong style='color:limegreen;'>Item Name:</strong>"+item.getItemName()+"</p>");
          Enumeration en=session.getAttributeNames();
          int count=0;
          while(en.hasMoreElements())
          {
              ++count;
              en.nextElement();
          }
          displayBlock.append("<p style='color:white;'><strong style='color:limegreen;'>Total Items In Cart:</strong>"+(count-1)+"</p>");
          displayBlock.append("<p><button style='height:40px;'><a href='StoreControllerServlet'>Continue Shopping</a></button>&nbsp;&nbsp;&nbsp;&nbsp;");
          displayBlock.append("<button style='height:40px;'><a href='placeorder.jsp'>Place Order</a></button></p></div>");
           displayBlock.append("<h4 id='logout'><button style='height:30px;background-color:black;text-align:center;'><a href='myorders.jsp' style='color:cyan'>My Orders</a>&nbsp;&nbsp;&nbsp;<button style='margin-left:20px;height:30px;background-color:black;text-align:center;'><a href='LoginControllerServlet?logout=logout' style='color:cyan;'>Logout</a></h4>");
                out.println(displayBlock);
          }
           
           
       
       %>
    </body>
</html>
