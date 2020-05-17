

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.util.*,shoppingcatalogue.*,shoppingcatalogue.dto.*"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="styles/stylesheet.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <script type="text/javascript" src="scripts/jquery.js">
            </script>
            <script type="text/javascript" src="scripts/removecart.js"></script>
        <title>Place Order Page</title>
    </head>
    <body>
        <%@include file='logo.html' %>
        <%
             String username=(String)session.getAttribute("username");
          if(username==null)
          {
              response.sendRedirect("accessdenied.html");
          }
          else
          {
             // int itemId=(Integer)session.getAttribute("itemid");
              StringBuffer displayBlock=new StringBuffer("<BR><BR><BR><BR><div style='background:rgba(0,0,0,0.9); margin-left:500px;text-align:center;width:500px;height:auto;padding-bottom:20px;border: solid 4px limegreen;border-radius:10px;'><h1 style='font-family:serif;color:limegreen;padding-top:10px;padding-bottom:10px;'>ORDER DETAILS</h1><hr style='width:120px;'> ");
              displayBlock.append("<br><div style='text-align:center;'>");
              Enumeration en=session.getAttributeNames();
              displayBlock.append("<table border='0' style='padding-left:120px;'>");
              displayBlock.append("<tr><th style='font-family:serif; color:limegreen;'>&nbsp;Item Name&nbsp;</th><th style='font-family:serif; color:limegreen;'>&nbsp;Item Price&nbsp;</th><th>&nbsp;&nbsp;</th></tr>");
              double totalAmount=0.0;
              while(en.hasMoreElements())
              {
                  Object o=en.nextElement();
                  if(o.equals("username")==false)
                  {
                    //  if(!request.getParameter("itemName").equalsIgnoreCase("username"))
                      //{
                        // session.removeAttribute(request.getParameter("itemName"));
                      //}
                      //else
                      //{
                      
                      ItemDTO item=(ItemDTO)session.getAttribute(o.toString());
                      //String str=item.getItemName();
                   //  str=str.replace(" ","%20");
                       displayBlock.append("<tr  id='"+item.getItemId()+"'><td style='color:white;'>"+item.getItemName()+"</td><td style='color:white;'>"+item.getItemPrice()+"</td><td ><a style='color:red;' href='#' onclick=removeRow('"+item.getItemId()+"')>Remove</a></td><tr>");
                       System.out.println(displayBlock);
                       totalAmount+=item.getItemPrice();
                      //}
                  }
              }
              displayBlock.append("</table>");
              displayBlock.append("<br><p style='color:white;text-align:center;'><strong style='font-family:serif;color:limegreen;font-size:18px;'>Total Amount To Pay:</strong>"+totalAmount+"</p>");
              displayBlock.append("<p><button style='height:40px;'><a href='StoreControllerServlet'>Continue Shopping</a></button>&nbsp;&nbsp;&nbsp;&nbsp;");
              displayBlock.append("<button style='height:40px;'><a href='checkout.jsp?totalAmount="+totalAmount+"'>CheckOut</a></button></p></div>");
              displayBlock.append("</div>");
               displayBlock.append("<h4 id='logout'><button style='height:30px;background-color:black;text-align:center;'><a href='myorders.jsp' style='color:cyan;'>My Orders</a>&nbsp;&nbsp;&nbsp;<button style='margin-left:20px;height:30px;background-color:black;text-align:center;'><a href='LoginControllerServlet?logout=logout' style='color:cyan;'>Logout</a></h4>");
                out.println(displayBlock);
             
          }
        %>
    </body>
</html>
