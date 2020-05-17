

<%@page import="shoppingcatalogue.dao.StoreDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.util.*,shoppingcatalogue.dto.OrderDTO,java.text.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="styles/stylesheet.css">
        <script type="text/javascript" src="scripts/jquery.js">
            </script>
            <script type="text/javascript" src="scripts/orderdetails.js"></script>
        <title>My Orders Page</title>
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
               StringBuffer displayBlock=new StringBuffer("<BR><BR><BR><BR><BR><BR><BR><div style='background:rgba(0,0,0,0.9);text-align:center;margin-left:500px;width:400px;border: solid 4px limegreen;border-radius:10px;'><h1 style='font-family:serif;color:limegreen;padding-top:10px;padding-bottom:10px;'>MY ORDERS</h1><hr style='width:120px;'>");
               displayBlock.append("<br><div style='text-align:center;'>");
               ArrayList<OrderDTO> orders=StoreDAO.getOrdersByCustomer(username);
               if(orders.size()==0)
               {
                   displayBlock.append("<p><strong>You have not placed any order yet</strong></p>");
                  
               }
               else
               {
                    displayBlock.append("<table id='t1' border='1' style='margin-left:30px;'>");
                    SimpleDateFormat sdf=new SimpleDateFormat("dd-MMM-yyyy");
                   displayBlock.append("<tr><th style='font-family:serif;color:limegreen;'>ORDER ID</th><th style='font-family:serif;color:limegreen;'>ORDER AMOUNT</th><th style='font-family:serif;color:limegreen;'>ORDER DATE</th></tr>");
                   for(OrderDTO orderList:orders)
                   {
                       String datestr=sdf.format(orderList.getOrderDate());
                    displayBlock.append("<tr><td><a href='#' onclick=getdetails('"+orderList.getOrderId()+"')>"+orderList.getOrderId()+"</a></td><td>"+"<span style='color:white;'>"+orderList.getOrderAmount()+"</span>"+"</td><td>"+"<span style='color:white;'>"+datestr+"</span>"+"</td></tr>");
                    // displayBlock.append("<tr><td>naman</td></tr>");
                      
                        
                   }
                   displayBlock.append("</table>");
                   
                      // System.out.println(displayBlock);
                   
               }
               displayBlock.append("<p><button style='height:30px;'><a href='StoreControllerServlet'>Show Categories</a></button></p><div>");
               displayBlock.append("</div>");
                displayBlock.append("<h4 id='logout'><button style='height:30px;background-color:black;'><a href='LoginControllerServlet?logout=logout' style='color:cyan;'>LOGOUT</a></h4>");
                
                
                
                out.println(displayBlock);
               
           }
       %>
    </body>
</html>
