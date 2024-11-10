<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="util.Info"%>
<%@page import="dao.CommDAO"%>
<%@page import="util.PageManager"%>
<html>
  <head>
    <title>货运中转</title>
	<link rel="stylesheet" href="images/hsgcommon/common.css" type="text/css">
<link rel="stylesheet" href="images/hsgcommon/div.css" type="text/css">
	<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js" charset="gb2312"></script>
  </head>


  <body >
  <p>已有货运中转列表：</p>
  <form name="form1" id="form1" method="post" action="">
   搜索:  途径中转站：<%=Info.getselect("tujingzhongzhuanzhan","tujingzhongzhuanzhan","tujingzhongzhuanzhanmingcheng"," 1=1 ")%> 车型：<select name='chexing' id='chexing' class="form-control2"><option value="">所有</option><option value="小轿">小轿</option><option value="越野">越野</option><option value="面包">面包</option><option value="大卡">大卡</option><option value="跑车">跑车</option></select>  驾驶员账号：<input name="jiashiyuanzhanghao" type="text" id="jiashiyuanzhanghao" class="form-control2"  />  驾驶员姓名：<input name="jiashiyuanxingming" type="text" id="jiashiyuanxingming" class="form-control2"  />
   <input type="submit" name="Submit" value="查找" class="btn btn-info btn-small" /> <input type="button" name="Submit2" value="导出EXCEL" class="btn btn-info btn-small" onClick="javascript:location.href='huoyunzhongzhuan_listxls.jsp';" />
</form>

<table width="100%" border="1" align="center" cellpadding="3" cellspacing="1" bordercolor="cccccc">  
  <tr>
    <td width="30" align="center" bgcolor="cccccc">序号</td>
    <td bgcolor='#cccccc'>中转编号</td>    <td bgcolor='#cccccc'>途径中转站</td>    <td bgcolor='#cccccc'>发车时间</td>    <td bgcolor='#cccccc'>车型</td>    <td bgcolor='#cccccc'>驾驶员账号</td>    <td bgcolor='#cccccc'>驾驶员姓名</td>    <td bgcolor='#cccccc'>手机</td>    <td bgcolor='#cccccc'>身份证</td>    <td bgcolor='#cccccc'>驾驶证号</td>        
	
    <td width="138" align="center" bgcolor="cccccc">添加时间</td>
    
    <td width="60" align="center" bgcolor="cccccc">操作</td>
  </tr>
  <% 
  	


  	 new CommDAO().delete(request,"huoyunzhongzhuan"); 
    String url = "huoyunzhongzhuan_list.jsp?1=1"; 
    String sql =  "select * from huoyunzhongzhuan where 1=1";
	if(request.getParameter("tujingzhongzhuanzhan")=="" ||request.getParameter("tujingzhongzhuanzhan")==null ){}else{sql=sql+" and tujingzhongzhuanzhan like '%"+request.getParameter("tujingzhongzhuanzhan")+"%'";}if(request.getParameter("chexing")=="" ||request.getParameter("chexing")==null ){}else{sql=sql+" and chexing like '%"+request.getParameter("chexing")+"%'";}if(request.getParameter("jiashiyuanzhanghao")=="" ||request.getParameter("jiashiyuanzhanghao")==null ){}else{sql=sql+" and jiashiyuanzhanghao like '%"+request.getParameter("jiashiyuanzhanghao")+"%'";}if(request.getParameter("jiashiyuanxingming")=="" ||request.getParameter("jiashiyuanxingming")==null ){}else{sql=sql+" and jiashiyuanxingming like '%"+request.getParameter("jiashiyuanxingming")+"%'";}
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
    <td width="60" align="center"><!--lianjie1--> <a class="btn btn-info btn-small" href="huoyunzhongzhuan_detail.jsp?id=<%=map.get("id")%>">详细</a> </td>
  </tr>
  	<%
  }
   %>
</table>
<br>
  
<p class="fy">${page.info }</p>


  </body>
</html>

