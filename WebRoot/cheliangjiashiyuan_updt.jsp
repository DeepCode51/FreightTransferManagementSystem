<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    <title>车辆驾驶员</title>
	
	<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
	<script type="text/javascript" src="js/popup.js"></script>
    <link rel="stylesheet" href="images/hsgcommon/common.css" type="text/css">
<link rel="stylesheet" href="images/hsgcommon/div.css" type="text/css">

  </head>
<script language="javascript">

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

  <body >
   <% 

String id = request.getParameter("id"); 

HashMap ext = new HashMap(); 

new CommDAO().update(request,response,"cheliangjiashiyuan",ext,true,false,""); 
HashMap mmm = new CommDAO().getmap(id,"cheliangjiashiyuan"); 

%>
  <form  action="cheliangjiashiyuan_updt.jsp?f=f&id=<%=mmm.get("id")%>"  method="post" name="form1"  onsubmit="return checkform();">
  修改车辆驾驶员:
  <br><br>
 
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#cccccc" style="border-collapse:collapse">  
          <tr><td>驾驶员账号：</td><td><input name='jiashiyuanzhanghao' type='text' id='jiashiyuanzhanghao' value='<%= mmm.get("jiashiyuanzhanghao")%>' class="form-control" /></td></tr>     <tr><td>密码：</td><td><input name='mima' type='text' id='mima' value='<%= mmm.get("mima")%>' class="form-control" /></td></tr>     <tr><td>驾驶员姓名：</td><td><input name='jiashiyuanxingming' type='text' id='jiashiyuanxingming' value='<%= mmm.get("jiashiyuanxingming")%>' class="form-control" /></td></tr>     <tr><td>性别：</td><td><select name='xingbie' id='xingbie' class="form-control2"><option value="男">男</option><option value="女">女</option></select></td></tr><script language="javascript">document.form1.xingbie.value='<%=mmm.get("xingbie")%>';</script>     <tr><td>驾龄：</td><td><input name='jialing' type='text' id='jialing' value='<%= mmm.get("jialing")%>' class="form-control" /></td></tr>     <tr><td>手机：</td><td><input name='shouji' type='text' id='shouji' value='<%= mmm.get("shouji")%>' class="form-control" /></td></tr>     <tr><td>身份证：</td><td><input name='shenfenzheng' type='text' id='shenfenzheng' class="form-control"  style="width:600px;" value='<%=mmm.get("shenfenzheng")%>' /></td></tr>     <tr><td>驾驶证号：</td><td><input name='jiashizhenghao' type='text' id='jiashizhenghao' value='<%= mmm.get("jiashizhenghao")%>' class="form-control" /></td></tr>     <tr><td>备注：</td><td><textarea name='beizhu' cols='50' rows='5' id='beizhu' class="form-control" style="width:600px;height:80px;" ><%=mmm.get("beizhu")%></textarea></td></tr>
    <tr>
      <td>&nbsp;</td>
      <td><input type="submit" name="Submit" value="提交" onClick="return checkform();" class="btn btn-info btn-small" />
      <input type="reset" name="Submit2" value="重置" class="btn btn-info btn-small" /></td>
    </tr>
  </table>
</form>

  </body>
</html>


