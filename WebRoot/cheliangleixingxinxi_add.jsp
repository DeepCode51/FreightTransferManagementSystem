<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    
    <title>车辆类型信息</title>
	
	<link rel="stylesheet" href="images/hsgcommon/common.css" type="text/css">
<link rel="stylesheet" href="images/hsgcommon/div.css" type="text/css">
    <script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
	<script type="text/javascript" src="js/popup.js"></script>
	   
  </head>
<%
  String id="";
  id=request.getParameter("id");
  
 
   %>
<script language="javascript">

function gow()
{
	document.location.href="cheliangleixingxinxi_add.jsp?id=<%=id%>";
}

function hsgxia2shxurxu(nstr,nwbk)
{
	if (eval("form1."+nwbk).value.indexOf(nstr)>=0)
	{
		eval("form1."+nwbk).value=eval("form1."+nwbk).value.replace(nstr+"；", "");
	}
	else
	{
		eval("form1."+nwbk).value=eval("form1."+nwbk).value+nstr+"；";
	}
}
</script>

 <% 
HashMap ext = new HashMap(); 
if(request.getParameter("f")!=null){










new CommDAO().insert(request,response,"cheliangleixingxinxi",ext,true,false,""); 

}

%>

  <body >
 <form  action="cheliangleixingxinxi_add.jsp?f=f&id=<%=id%>"  method="post" name="form1"  onsubmit="return checkform();">
  添加车辆类型信息:
  <br><br>
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#cccccc" >
		<tr><td  width="200">车辆类型：</td><td><input name='cheliangleixing' type='text' id='cheliangleixing' value='' onblur='checkform()' class="form-control" />&nbsp;*<label id='clabelcheliangleixing' /></td></tr>		
    <tr>
      <td>&nbsp;</td>
      <td><input type="submit" name="Submit" value="提交"  class="btn btn-info btn-small" />
      <input type="reset" name="Submit2" value="重置" class="btn btn-info btn-small" /></td>
    </tr>
  </table>
</form>

  </body>
</html>



<script language=javascript src='js/ajax.js'></script>

<%@page import="java.util.ArrayList"%> 
<%@page import="java.util.HashMap"%> 

<script language=javascript >  
 
 function checkform(){  
 
	var cheliangleixingobj = document.getElementById("cheliangleixing"); if(cheliangleixingobj.value==""){document.getElementById("clabelcheliangleixing").innerHTML="&nbsp;&nbsp;<font color=red>请输入车辆类型</font>";return false;}else{document.getElementById("clabelcheliangleixing").innerHTML="  "; } 	var cheliangleixingobj = document.getElementById("cheliangleixing");  
if(cheliangleixingobj.value!=""){  
var ajax = new AJAX();
ajax.post("factory/checkno.jsp?table=cheliangleixingxinxi&col=cheliangleixing&value="+cheliangleixingobj.value+"&checktype=insert&ttime=<%=Info.getDateStr()%>") 
var msg = ajax.getValue();
if(msg.indexOf('Y')>-1){
document.getElementById("clabelcheliangleixing").innerHTML="&nbsp;&nbsp;<font color=red>车辆类型已存在</font>";  
return false;
}else{document.getElementById("clabelcheliangleixing").innerHTML="  ";  
}  
} 	


return true;   
}   
popheight=450;
</script>  
<script src="images/hsgcommon/jq.js"></script>
<script src="images/hsgcommon/common.js"></script>
<script src="images/hsgcommon/bootbox.js"></script>
