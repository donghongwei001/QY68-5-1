<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
    <HEAD>
        <title>年月日三联动下拉框</title>
        <meta http-equiv='Content-Type' content='text/html; charset=gb2312'>
        <meta name='author' content='http://singlepine.cnblogs.com/'>
    </HEAD>
    <body>
        <form name="form1">
            <select name="YYYY" onchange="YYYYDD(this.value)">
                <option value="" selected>请选择 年</option>
            </select>
            <select name="MM" onchange="MMDD(this.value)">
                <option value="" selected>选择 月</option>
            </select>
            <select name="DD">
                <option value="" selected>选择 日</option>
            </select>
        </form>
        <script language="JavaScript"><!--
            function YYYYMMDDstart()
            {
                MonHead = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];

                //先给年下拉框赋内容
                var y   = new Date().getFullYear();
                for (var i = (y-30); i < (y+30); i++) //以今年为准，前30年，后30年
                    document.form1.YYYY.options.add(new Option(" "+ i +" 年", i));

                //赋月份的下拉框
                for (var i = 1; i < 13; i++)
                    document.form1.MM.options.add(new Option(" " + i + " 月", i));

                document.form1.YYYY.value = y;
                document.form1.MM.value = new Date().getMonth() + 1;
                var n = MonHead[new Date().getMonth()];
                if (new Date().getMonth() ==1 && IsPinYear(YYYYvalue)) n++;
                    writeDay(n); //赋日期下拉框
                document.form1.DD.value = new Date().getDate();
            }
            if(document.attachEvent)
                window.attachEvent("onload", YYYYMMDDstart);
            else
                window.addEventListener('load', YYYYMMDDstart, false);
            function YYYYDD(str) //年发生变化时日期发生变化(主要是判断闰平年)
            {
                var MMvalue = document.form1.MM.options[document.form1.MM.selectedIndex].value;
                if (MMvalue == ""){ var e = document.form1.DD; optionsClear(e); return;}
                var n = MonHead[MMvalue - 1];
                if (MMvalue ==2 && IsPinYear(str)) n++;
                    writeDay(n)
            }
            function MMDD(str)  //月发生变化时日期联动
            {
                var YYYYvalue = document.form1.YYYY.options[document.form1.YYYY.selectedIndex].value;
                if (YYYYvalue == ""){ var e = document.form1.DD; optionsClear(e); return;}
                var n = MonHead[str - 1];
                if (str ==2 && IsPinYear(YYYYvalue)) n++;
                    writeDay(n)
            }
            function writeDay(n)  //据条件写日期的下拉框
            {
                var e = document.form1.DD; optionsClear(e);
                for (var i=1; i<(n+1); i++)
                    e.options.add(new Option(" "+ i + " 日", i));
            }
            function IsPinYear(year)//判断是否闰平年
            {  
                return(0 == year%4 && (year%100 !=0 || year%400 == 0));
            }
            function optionsClear(e)
            {
                e.options.length = 1;
            }
    //-->
    </script>
    </body>
</HTML>
