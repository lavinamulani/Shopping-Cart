

<%@page import="shoppingcatalogue.dao.StoreDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.util.*,shoppingcatalogue.dto.*"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="styles/stylesheet.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CheckOut Page</title>
    </head>
    <body>
        <%@include file="logo.html" %>
        <%
            String username=(String)session.getAttribute("username");
            if(username==null)
            {
                response.sendRedirect("accessdenied.jsp");
            }
            else
            {
                String totalAmount=request.getParameter("totalAmount");
                StringBuffer displayBlock=new StringBuffer("<BR><BR><BR><BR><div style='background:rgba(0,0,0,0.9); margin-left:500px;text-align:center;width:500px;height:auto;padding-bottom:20px;border: solid 4px limegreen;border-radius:10px;'><h1 style='font-family:serif;color:limegreen;padding-top:10px;padding-bottom:10px;'>Check Out </h1><hr style='width:120px;'>");
                displayBlock.append("<br><div style='text-align:center;'>");
                displayBlock.append("<p><strong style='font-family:serif;color:limegreen;font-size:18px;'>Thank You For Shopping With Us!!<strong></p>");
                displayBlock.append("<p><strong style='font-family:serif;color:white;font-size:18px;'>Your Payment Of Rs "+totalAmount+" will be through COD</strong></p>");
                displayBlock.append("<p><strong style='font-family:serif;color:white;font-size:18px;'>Your item will be delivered soon at your location.</strong></p>");
                
                Enumeration en=session.getAttributeNames();
                ArrayList<ItemDTO> itemList=new ArrayList<ItemDTO>();
                
                while(en.hasMoreElements())
                {
                    Object o=en.nextElement();
                    if(o.equals("username")==false)
                    {
                        ItemDTO item=(ItemDTO)session.getAttribute(o.toString());
                        itemList.add(item);
                        session.removeAttribute(o.toString());
                    }
                }
                try
                {
                    StoreDAO.addOrder(username, itemList, Double.parseDouble(totalAmount));
//                    displayBlock.append("<p><strong>Order saved in the database:</strong></p>");
                    
                }
                catch(Exception ex)
                {
                    System.out.println("Exception from storeModel.addOrder:"+ex);
                    ex.printStackTrace();
                }
                
                displayBlock.append("<p><button style='height:40px;'><a href='StoreControllerServlet'>Shop Again</a></button>&nbsp;&nbsp;&nbsp;&nbsp;");
                displayBlock.append("<button style='height:40px;'><a href='myorders.jsp'>My Orders</a></button></p></div></div>");
//                displayBlock.append("</div>");
                 displayBlock.append("<h4 id='logout'><button style='height:30px;background-color:black;text-align:center;'><a href='myorders.jsp' style='color:cyan;text-align:center;'>My Orders</a>&nbsp;&nbsp;&nbsp;<button style='margin-left:20px;height:30px;background-color:black;'><a href='LoginControllerServlet?logout=logout' style='color:cyan;'>Logout</a></h4>");
                out.println(displayBlock);
                
            }
        %>
    </body>
</html>
