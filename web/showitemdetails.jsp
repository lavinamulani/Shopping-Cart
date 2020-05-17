
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.util.*,shoppingcatalogue.dto.ItemDTO"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="styles/stylesheet.css">
        <script type="text/javascript" src="script/jquery.js">
            </script>
            <script type="text/javascript" src="script/showItem.js"></script>
        <title>Store Items</title>
    </head>
    <body>
        <%
             String username=(String)session.getAttribute("username");
           
           
            if(username==null)
            {
                session.invalidate();
                response.sendRedirect("accessdenied.html");
            }
            else
            {
                StringBuffer displayBlock=new StringBuffer("<br><br><div style='background:rgba(0,0,0,0.9); margin-left:500px;text-align:center;width:400px;padding-bottom:20px;border: solid 4px limegreen;border-radius:10px;'><h1 style='font-family:serif;color:limegreen;padding-top:10px;padding-bottom:10px;'>ITEM DETAILS</h1><hr style='width:120px;'><p ><em style='color:limegreen;'>You are viewing:</em><br/>");
               // System.out.println(displayBlock);
               
                ItemDTO details=(ItemDTO)request.getAttribute("itemdetails");
               
                    displayBlock.append("<strong><a href='StoreControllerServlet'>"+details.getItemType()+"&gt;</a>"+"<span style='color:white;'>"+details.getItemName()+"</span>"+"</strong></p>");
                    displayBlock.append("<div style='float:left;'>");
                    displayBlock.append("<img src=/'images/"+details.getItemImage()+"'></div>");
//                    displayBlock.append("<div style='background:rgba(0,0,0,0.9); margin-left:500px;text-align:center;width:400px;'");
                    
                    displayBlock.append("<br><p style='color:white;font-size:18px;'><strong style='color:limegreen;'>Description:</strong><br/>"+details.getItemDesc()+"</p>");
                    displayBlock.append("<p style='color:white;font-size:18px;'><strong style='color:limegreen;'>Price:</strong>Rs"+details.getItemPrice()+"</p>");
                    displayBlock.append("<button><p><a href='addtocart.jsp?itemId="+details.getItemId()+"'>Add To Cart</a></p></button></div></div>");
                     displayBlock.append("<h4 id='logout'><button style='height:30px;background-color:black;text-align:center;'><a href='myorders.jsp' style='color:cyan;'>My Orders</a>&nbsp;&nbsp;&nbsp;<button style='margin-left:30px;height:30px;background-color:black;text-align:center;'><a href='LoginControllerServlet?logout=logout' style='color:cyan;'>Logout</a></h4>");
                out.println(displayBlock);
            }
        %>
    </body>
</html>