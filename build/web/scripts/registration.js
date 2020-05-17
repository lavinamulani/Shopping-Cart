/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$(document).ready(function()
{
    $("#username").focus(function()
    {
        $("#span1").text("");
    });
     $("#password").focus(function()
    {
        $("#span2").text("");
    });  
    
     $("#address").focus(function()
    {
        $("#span3").text("");
    });  
     $("#mobile").focus(function()
    {
        $("#span4").text("");
    });  
    
    $("#registerbtn").click(function()
    {
        connect();
    });
});

function connect()
{
    if(!validate())
        return;
    
    var data={username:username,password:password,address:address,mobile:mobile};
    alert(" "+data);
    var request=$.post("RegistrationControllerServlet",data,processResponse);
    request.error(handleError);
    
}

function validate()
{
    username=$("#username").val();
    password=$("#password").val();
    address=$("#address").val();
    mobile=$("#mobile").val();
    if(username==="")
        $("#span1").html("Username Required!").css("font-weight","bold").css("color","red");
    if(password==="")
       $("#span2").html("Password Required!").css("font-weight","bold").css("color","red"); 
   
   if(address==="")
       $("#span3").html("Address Required!").css("font-weight","bold").css("color","red"); 
   if(mobile==="")
       $("#span4").html("Contact Number Required!").css("font-weight","bold").css("color","red"); 
   
   if(username===""||password==="" ||address==="" ||mobile==="")
       return false;
   return true;
}

function processResponse(responseText)
{
    responseText=responseText.trim();
    if(responseText==='success')
    { 
        $("#regresult").html("Registration Successfully<br>Click here to login").css("font-weight","bold").css("color","green").bind("click", function(){window.location.href = 'login.html';});
        cleartext();
    }
    else if(responseText==="uap")
    {
       
        $("#regresult").html("Sorry! the username is already present!").css("font-weight","bold").css("color","red");
       cleartext();
    }
     else if(responseText==="failure")
    {
        $("#regresult").text("Registration Failed! Try Again").css("font-weight","bold").css("color","red");
         cleartext();
    }
     else
    {
        $("#regresult").text("Some problem at the server! Try Again Later").css("font-weight","bold").css("color","red");
      cleartext();
   }
    
   
}

function handleError(xhr,textStatus)
{
    if(textStatus==='error')
        $("#regresult").text('An error occured during your request: '+xhr.status);
}

function cleartext()
{
     $("#username").text("");
     $("#password").text("");
     $("#address").text("");
     $("#mobile").text("");
}