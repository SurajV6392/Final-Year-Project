
<!--<%@ include file="uheader.jsp"%>
<%@ page  import="java.sql.*" import="databaseconnection.*" import="javax.swing.JOptionPane"%>


<%
    String message=request.getParameter("id");
    if(message!=null && message.equalsIgnoreCase("ok")){
    out.println("<script type=text/javascript>alert('Operation Successfull !!')</script>");
	}
 %>
<%String email1=(String)session.getAttribute("email");%>

<% String mail=request.getParameter("email");
%> 
<%
try{

Connection con = databasecon.getconnection();
Statement st=con.createStatement();
String sql="select * from frequest where uto='"+email1+"' and requ='req' ";
System.out.println(sql);
ResultSet rs=st.executeQuery(sql);
%> -->
<table align="center" >
<tr><td>
<tr><td> <h2>Requests from</h2>
<%
while(rs.next()){

%>
<tr><td colspan=2> <img src="view.jsp?id=<%=rs.getString("ufrom")%>" alt="" width="300" height="200" >
<tr><td colspan=2> <br><h3>Email:	<%=rs.getString("ufrom")%><input type="hidden" name="mail" value="<%=rs.getString("uto")%>"/>
<tr><td>
<form method="post" action="accept.jsp">
<input type="hidden" name="mail" value="<%=rs.getString("ufrom")%>"/>
<input type="submit" value="Accept"/>				
</form>

<%
}
}
catch(Exception e){
}
%>
</table>
<%@ include file="ufooter.jsp"%>
