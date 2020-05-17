<%@page contentType="text/html" pageEncoding="UTF-8" import="org.json.JSONObject,shoppingcatalogue.dto.*"%>

<%
    JSONObject json=new JSONObject();
    ItemDTO item=(ItemDTO)request.getAttribute("itemDetails");
    json.put("pname", item.getItemName());
    json.put("ptype", item.getItemType());
    json.put("pprice",item.getItemPrice());
    json.put("pdesc", item.getItemDesc());
    json.put("pimage", item.getItemImage());
    //json=JSON.stringify(json);
    out.println(json);
%>
