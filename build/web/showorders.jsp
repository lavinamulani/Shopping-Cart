

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.util.*,shoppingcatalogue.dto.*,java.text.*"%>
<%
    ArrayList<OrderDTO> orders=(ArrayList)request.getAttribute("orders");
    StringBuffer displayBlock=new StringBuffer("<table border=2>");
    SimpleDateFormat sdf=new SimpleDateFormat("dd-MMM-yyyy");
    displayBlock.append("<tr><th>Order Id</th><th>Order Amount</th><th>Order Date</th><th>View Details</th></tr>");
    for(OrderDTO o:orders)
    {
        String date=sdf.format(o.getOrderDate());
        displayBlock.append("<tr><td>"+o.getOrderId()+"</td><td>"+o.getOrderAmount()+"</td><td>"+date+"</td><td><a href='#'  id='"+o.getOrderId()+"' onclick='viewOrderDetails()'>Click Here</a></td></tr>");
    }
    displayBlock.append("</table>");
    System.out.println(displayBlock);
    out.println(displayBlock);
%>
