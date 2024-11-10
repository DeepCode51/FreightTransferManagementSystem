<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    <title>车辆驾驶员详细</title>
    <link rel="stylesheet" href="images/hsgcommon/common.css" type="text/css">
<link rel="stylesheet" href="images/hsgcommon/div.css" type="text/css">

  </head>

  <body >
  <%
	String id=request.getParameter("id");
	HashMap m = new CommDAO().getmap(id,"cheliangjiashiyuan");
     %>
  车辆驾驶员详细:
  <br><br>
  
   <table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="#cccccc" >  
   <tr>
     <td width='11%'>驾驶员账号：</td><td width='39%'><%=m.get("jiashiyuanzhanghao")%></td><td width='11%'>密码：</td><td width='39%'><%=m.get("mima")%></td></tr><tr><td width='11%'>驾驶员姓名：</td><td width='39%'><%=m.get("jiashiyuanxingming")%></td><td width='11%'>性别：</td><td width='39%'><%=m.get("xingbie")%></td></tr><tr><td width='11%'>驾龄：</td><td width='39%'><%=m.get("jialing")%></td><td width='11%'>手机：</td><td width='39%'><%=m.get("shouji")%></td></tr><tr><td width='11%'>身份证：</td><td width='39%'><%=m.get("shenfenzheng")%></td><td width='11%'>驾驶证号：</td><td width='39%'><%=m.get("jiashizhenghao")%></td></tr><tr><td width='11%'>备注：</td><td width='39%'><%=m.get("beizhu")%></td><td>&nbsp;</td><td>&nbsp;</td></tr><tr><td colspan=4 align=center><input type=button name=Submit5 value=返回 onClick="javascript:history.back()" />&nbsp;<input type=button name=Submit5 value=打印 onClick="javascript:window.print()" /></td></tr>
    
  </table>

  </body>
</html>



