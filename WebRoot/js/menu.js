// JavaScript Document
function show(str)
{
	var str1="td"+str;
	var str="show"+str;
	for (var i=1; i<=28; i++)
	{
        var obj = document.getElementById('show' + i.toString());
        if (obj) obj.style.display = 'none';
	}

	document.getElementById(str).style.display="";
}
