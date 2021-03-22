<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tabela Camera</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <style>
        ul {
  		list-style-type: none;
  		margin: 0;
  		padding: 0;
  		overflow: hidden;
  		background-color: #333;
		}

		li {
  		float: left;
		}

		li a {
  		display: block;
  		color: white;
  		text-align: center;
  		padding: 14px 16px;
  		text-decoration: none;
		}
        body{background-color:#FAF0E6}
		table { 
  
  		border-collapse: collapse;
  		width: 80%;

 		}
 		th,td {
  		text-align: left;
 		padding: 8px;
		}
 

		td {
  		background-color:#F5F5F5; 
  		color: black;
  		}
		th {
 		background-color: #1E90FF;
  		color: black;
		}
		table.center {
  		margin-left: 20%; 
  		margin-right: 20%;
		}
		
		input[type=text] {
  		padding: 12px 30px;
  		box-sizing: border-box;
  		border: 2px solid #ccc;
  		border-radius: 10px;
  		background-color: #f8f8f8;
  		font-size: 16px;
  		resize: none;
		}
		input[type=number] {

		width:120px;
  		padding: 12px 12px;
  		box-sizing: border-box;
  		border: 2px solid #ccc;
  		border-radius: 10px;
  		background-color: #f8f8f8;
  		font-size: 16px;
  		resize: none;
		}
		</style>
    </head>
    <jsp:useBean id="jb" scope="session" class="db.JavaBean" />
    <jsp:setProperty name="jb" property="*" />
    <body>
    	<ul>
    	<li><a href="index.html"><b><strong>Home</strong></b></a></li>
    	<li><a href="tabela_hotel.jsp"><b><strong>Hotel</strong></b></a></li>
    	<li><a href="tabela_camera.jsp"><b><strong>Camera</strong></b></a></li>
    	<li><a href="tabela_cazare.jsp"><b><strong>Cazare</strong></b></a></li>
    	</ul>
        <h1 align="center"> Tabela Camera:</h1>
        <br/>
        <form action="m1_camera.jsp" method="post">
            <table border="1" align="center">
                <tr>
                    <td><b>Mark:</b></td>
                    <td><b>IdCamera:</b></td>
                    <td><b>Numar Camera:</b></td>
                    <td><b>Numar Paturi:</b></td>
                    <td><b>Balcon:</b></td>
                    <td><b>Bucatarie:</b></td>
                </tr>
                <%
                    jb.connect();
                    ResultSet rs = jb.vedeTabela("camera");
                    long x;
                    while (rs.next()) {
                        x = rs.getLong("idcamera");
                %>
                <tr>
                    <td><input type="checkbox" name="primarykey" value="<%= x%>" /></td>
                    <td><%= rs.getInt("idcamera")%></td>
                    <td><%= rs.getInt("numarcamera")%></td>
                    <td><%= rs.getInt("numarpaturi")%></td>
                    <td><%= rs.getString("balcon")%></td>
                    <td><%= rs.getString("bucatarie")%></td>
                    <%
                        }
                    %>
                </tr>
            </table><br/>
            <p align="center">
                <input type="submit" class = "btn btn-primary" value="Modifica linia">
            </p>
        </form>
        <%
    jb.disconnect();%>
        <br/>
        <p align="center">
        	<a href="tabela_camera.jsp"><button type="button" class="btn btn-primary">Back</button></a>
        </p>
    </body>
</html>