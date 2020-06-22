<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<%try {
Class.forName("com.mysql.jdbc.Driver");
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
ResultSet rs = null;
%>
<html>
<head>
	<title>Chatscreen</title>
	<link rel="stylesheet" type="text/css" href="../stylesheets/chatstyle.css">
	<link rel="icon" type="image/png"href="../images/favicon.png">
</head>
<body>
	<div class="menu">
	<a href="dashboard.jsp"class="formbut">Dashboard</a>
	<a href="logout.jsp"class="formbut">logout</a>
	<a href="chat.jsp" class="formbut">Refresh</a><br><br>
	</div>
	<%String sid=(String)session.getAttribute("sid");
	String fid=(String)session.getAttribute("fid");
	String sname=(String)session.getAttribute("sname");
	String fname=(String)session.getAttribute("fname");
	String fgen=(String)session.getAttribute("fgen");
	String sender=null;%>
		<form action="newmsg.jsp" method="post" class="form">
	<input type="text" name="message" placeholder="Type new message here!" class="newmsg" autocomplete="off"required>
	<input type="submit"name="Send" value="SEND" class="button">
</form><%
try{
Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/chat_project", "root", "");
Statement st=connection.createStatement();
rs=st.executeQuery("select send,reci,msgs,time_format(timing,'%h:%i') as time from msg where (send='"+sid+"'and reci='"+fid+"') or (reci='"+sid+"' and send='"+fid+"')order by timing desc");
while(rs.next()){
	if(sid.equals(rs.getString("send"))){sender="Me";}else if(fgen.equals("Male")){sender=fname+" Sir";}else{sender=fname+"Ma'am";}
if(sender.equals("Me")){%>
<section  class="chatscreen"><div>
<textarea disabled class="container">
<%out.println(sender+"     "+(String)rs.getString("time"));
out.print(rs.getString("msgs"));%>
</textarea></div>
<%}else{%>
	<div>
  <textarea disabled class="container2">
  	<%out.println(sender+"     "+(String)rs.getString("time"));
  	out.print(rs.getString("msgs"));%>
  	</textarea>
</div></section>
<%}%>
<%sender=null;}
PreparedStatement st2=connection.prepareStatement("UPDATE msg SET status=? WHERE reci=? and send=?");
st2.setInt(1,1);
st2.setString(2,sid);
st2.setString(3,fid);
st2.executeUpdate();
connection.close();
}catch (Exception e){out.print(e.getMessage());}
%>
</body>
</html>