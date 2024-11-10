<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    <title>车辆驾驶员</title>
	<link rel="stylesheet" href="images/hsgcommon/common.css" type="text/css">
<link rel="stylesheet" href="images/hsgcommon/div.css" type="text/css">
	<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
  </head>


  <body >
  <p>已有车辆驾驶员列表：</p>
  <form name="form1" id="form1" method="post" action="">
   搜索:  驾驶员账号：<input name="jiashiyuanzhanghao" type="text" id="jiashiyuanzhanghao" class="form-control2"  />  驾驶员姓名：<input name="jiashiyuanxingming" type="text" id="jiashiyuanxingming" class="form-control2"  /> 性别：<select name='xingbie' id='xingbie' class="form-control2"><option value="">所有</option><option value="男">男</option><option value="女">女</option></select>
   <input type="submit" name="Submit" value="查找" class="btn btn-info btn-small" /> <input type="button" name="Submit2" value="导出EXCEL" class="btn btn-info btn-small" onClick="javascript:location.href='cheliangjiashiyuan_listxls.jsp';" />
</form>

<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="cccccc">  
  <tr>
    <td width="30" align="center" bgcolor="cccccc">序号</td>
    <td bgcolor='#cccccc'>驾驶员账号</td>    <td bgcolor='#cccccc'>密码</td>    <td bgcolor='#cccccc'>驾驶员姓名</td>    <td bgcolor='#cccccc' width='40' align='center'>性别</td>    <td bgcolor='#cccccc'>驾龄</td>    <td bgcolor='#cccccc'>手机</td>    <td bgcolor='#cccccc'>身份证</td>    <td bgcolor='#cccccc'>驾驶证号</td>        
	
    <td width="138" align="center" bgcolor="cccccc">添加时间</td>
    
    <td width="60" align="center" bgcolor="cccccc">操作</td>
  </tr>
  <% 
  	


  	 new CommDAO().delete(request,"cheliangjiashiyuan"); 
    String url = "cheliangjiashiyuan_list.jsp?1=1"; 
    String sql =  "select * from cheliangjiashiyuan where 1=1";
	if(request.getParameter("jiashiyuanzhanghao")=="" ||request.getParameter("jiashiyuanzhanghao")==null ){}else{sql=sql+" and jiashiyuanzhanghao like '%"+request.getParameter("jiashiyuanzhanghao")+"%'";}if(request.getParameter("jiashiyuanxingming")=="" ||request.getParameter("jiashiyuanxingming")==null ){}else{sql=sql+" and jiashiyuanxingming like '%"+request.getParameter("jiashiyuanxingming")+"%'";}if(request.getParameter("xingbie")=="" ||request.getParameter("xingbie")==null ){}else{sql=sql+" and xingbie like '%"+request.getParameter("xingbie")+"%'";}
    sql+=" order by id desc";
	ArrayList<HashMap> list = PageManager.getPages(url,15,sql, request); 
	int i=0;
	for(HashMap map:list){ 
	i++;
	
	


     %>
  <tr>
    <td width="30" align="center"><%=i %></td>
    <td><%=map.get("jiashiyuanzhanghao") %></td>    <td><%=map.get("mima") %></td>    <td><%=map.get("jiashiyuanxingming") %></td>    <td align='center'><%=map.get("xingbie") %></td>    <td><%=map.get("jialing") %></td>    <td><%=map.get("shouji") %></td>    <td><%=map.get("shenfenzheng") %></td>    <td><%=map.get("jiashizhenghao") %></td>        
	
    <td width="138" align="center"><%=map.get("addtime") %></td>
    <td width="60" align="center"><!--lianjie1--> <a class="btn btn-info btn-small" href="cheliangjiashiyuan_detail.jsp?id=<%=map.get("id")%>">详细</a> </td>
  </tr>
  	<%
  }
   %>
</table>
<br>
  
<p class="fy">${page.info }</p>


  </body>
</html>

