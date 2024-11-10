<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>

<%
response.setContentType("application/vnd.ms-excel");
response.addHeader("Content-Disposition", "attachment;filename=huoyunzhongzhuan.xls");
%>
<html>
  <head>
    <title>货运中转</title>
	<link rel="stylesheet" href="images/hsgcommon/common.css" type="text/css">
<link rel="stylesheet" href="images/hsgcommon/div.css" type="text/css">
  </head>

  <body >
  <p>已有货运中转列表：</p>
  

<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="cccccc" >  
  <tr>
    <td width="30" align="center" bgcolor="cccccc">序号</td>
    <td bgcolor='#cccccc'>中转编号</td>    <td bgcolor='#cccccc'>途径中转站</td>    <td bgcolor='#cccccc'>发车时间</td>    <td bgcolor='#cccccc'>车型</td>    <td bgcolor='#cccccc'>驾驶员账号</td>    <td bgcolor='#cccccc'>驾驶员姓名</td>    <td bgcolor='#cccccc'>手机</td>    <td bgcolor='#cccccc'>身份证</td>    <td bgcolor='#cccccc'>驾驶证号</td>        
    <td width="138" align="center" bgcolor="cccccc">添加时间</td>
    

  </tr>
  <% 

    String url = "huoyunzhongzhuan_list.jsp?1=1"; 
    String sql =  "select * from huoyunzhongzhuan where 1=1";
    sql+=" order by id desc";
	ArrayList<HashMap> list = PageManager.getPages(url,15,sql, request); 
	int i=0;
	for(HashMap map:list){ 
	i++;

     %>
  <tr>
    <td width="30" align="center"><%=i %></td>
    <td><%=map.get("zhongzhuanbianhao") %></td>    <td><%=map.get("tujingzhongzhuanzhan") %></td>    <td><%=map.get("facheshijian") %></td>    <td><%=map.get("chexing") %></td>    <td><%=map.get("jiashiyuanzhanghao") %></td>    <td><%=map.get("jiashiyuanxingming") %></td>    <td><%=map.get("shouji") %></td>    <td><%=map.get("shenfenzheng") %></td>    <td><%=map.get("jiashizhenghao") %></td>        
    <td width="138" align="center"><%=map.get("addtime") %></td>
  </tr>
  	<%
  }
   %>
</table>

<br>
以上数据共<%=i %>条
  </body>
</html>

