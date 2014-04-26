function OP() {
    var Days = 2;
    var exp = new Date();
    exp.setTime(exp.getTime() + Days * 24 * 60 * 60 * 1000);
    var x = document.getElementById("TextBox_repassword").value
    var y = document.getElementById("TextBox_pass").value
    var email = document.getElementById("TextBox_email").value
    var password=document.getElementById("TextBox_pass").value
   //alert(email);
   //alert(password);
/*   var lb = document.getElementById("Label_presentation").value;
  alert(lb);
     var btn = document.getElementById("Button_signup").value
     alert(btn);*/
   if(x!=y)
    {
       document.getElementById("Label_presentation").style.display = "block"
       document.getElementById("Button_signup")
       document.cookie = "name=value&key=f;expires=" + exp.toGMTString() + ";path=/";
   }
   else if (email=="")
   {
       document.getElementById("Label_presentation").value = "Please give the propriate information";
       document.getElementById("Label_presentation").style.display = "block";
       document.cookie = "name=value&key=f;expires=" + exp.toGMTString() + ";path=/";
   }
    else
   {
       document.getElementById("Label_presentation").style.display = "none"
       document.getElementById("Button_signup").Enabled = "true";
       document.cookie = "name=value&key=t;expires=" + exp.toGMTString() + ";path=/";
   }
 //  alert(document.getElementById("Label_presentation").style.display);
   localStorage.setItem("host", document.getElementById("Label_presentation").style.display)
}