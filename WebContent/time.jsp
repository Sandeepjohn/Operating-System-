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
<h3> Before Time Slicing</h3>
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

</center>

<center>
<h1>  Values after applying algorithm</h1>
<%

int w1=Integer.parseInt(request.getParameter("t1"));
int x1=Integer.parseInt(request.getParameter("t2"));
int y1=Integer.parseInt(request.getParameter("t3"));
int z1=Integer.parseInt(request.getParameter("t4"));
int t=Integer.parseInt(request.getParameter("t5"));
int bt1[]={w,x,y,z};
int n1,i1,j1;
float  avwt1=0,avtat1=0;
int c1[]={w-t-1/2,x-t-1/2,y-t-1/2,z-t-1/2};
int wt1[]=new int[20];
int tat1[]=new int[20];


wt[0]=0;    //waiting time for first process is 0

//calculating waiting time
for(i=1;i<4;i++)
{
    wt1[i]=0;
    for(j1=0;j1<i;j1++)
        wt1[i]+=c1[j1];
}
%>
<h3> After Time Slicing</h3>
<table border="5"  cellspacing="5" cellspacing="5">
<tr><th>Process Time</th><th>Burst Time</th><th>Waiting Time</th><th>Turn Around Time</th></tr>
<% 
//calculating turnaround time
for(i1=0;i1<4;i1++)

{
    tat1[i1]=c1[i1]+wt1[i1];
    avwt1+=wt1[i1];
    avtat1+=tat1[i1];
    
    %>
    <tr>
    <th><%=i1+1 %></th>
    <th><%=bt1[i1] %></th>
    <th><%=wt1[i1] %></th>
    <th><%=tat1[i1] %></th></tr>
    
 <%
}


avwt1/=i;
avtat1/=i;
   
   


%>
<tr>
<th colspan="2">Average Waiting Time</th>
<th colspan="2"><%=avwt1 %></th>
</tr>
<tr>
<th colspan="2">Average Turnaround Time</th>
<th colspan="2"><%=avtat1 %></th>
</tr>
</table>
<br>

</center>
</body>
</html>