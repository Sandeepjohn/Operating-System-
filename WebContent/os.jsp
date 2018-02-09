<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<center>
<%

int w=Integer.parseInt(request.getParameter("t1"));
int x=Integer.parseInt(request.getParameter("t2"));
int y=Integer.parseInt(request.getParameter("t3"));
int z=Integer.parseInt(request.getParameter("t4"));


int bt[]={w,x,y,z};
int n,i,j;
float  avwt=0,avtat=0;
int c[]=new int[20];
int wt[]=new int[20];
int tat[]=new int[20];


wt[0]=0;    //waiting time for first process is 0

//calculating waiting time
for(i=1;i<4;i++)
{
    wt[i]=0;
    for(j=0;j<i;j++)
        wt[i]+=bt[j];
}
%>
<h1> Before Time Slicing</h1>
<table border="5"  cellspacing="5" cellspacing="5">
<tr><th>Process Time</th><th>Burst Time</th><th>Waiting Time</th><th>Turn Around Time</th></tr>
<% 
//calculating turnaround time
for(i=0;i<4;i++)

{
    tat[i]=bt[i]+wt[i];
    avwt+=wt[i];
    avtat+=tat[i];
    
    %>
    <tr>
    <th><%=i+1 %></th>
    <th><%=bt[i] %></th>
    <th><%=wt[i] %></th>
    <th><%=tat[i] %></th></tr>
    
 <%
}


avwt/=i;
avtat/=i;
   
   


%>
<tr>
<th colspan="2">Average Waiting Time</th>
<th colspan="2"><%=avwt %></th>
</tr>
<tr>
<th colspan="2">Average Turnaround Time</th>
<th colspan="2"><%=avtat %></th>
</tr>
</table>
<br>
<br>
<form action="time.jsp">
Enter the Time Slice Value:<input type="text" name="t5">
<input type="hidden" name="t1" value=<%=w %>>
<input type="hidden" name="t2" value=<%=x %>>
<input type="hidden" name="t3" value=<%=y %>>
<input type="hidden" name="t4" value=<%=z %>>
<input type="submit" value"submit">
</form>
</center>
</body>
</html>