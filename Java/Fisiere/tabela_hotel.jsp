<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.lang.*,java.math.*,db.*,java.sql.*, java.io.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tabela Hotel</title>
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
		/*th {
 		background-color: #1E90FF;
  		color: black;
		}*/
		table.center {
  		margin-left: 20%; 
  		margin-right: 20%;
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
        <h1 align="center"> Tabela Hotel:</h1>
        <br/>
        <div align="center">
        <div class="btn-group">
    <a href="nou_hotel.jsp"><button type="button" class="btn btn-primary">Adauga</button></a>
    <a href="modifica_hotel.jsp"><button type="button" class="btn btn-primary">Modifica</button></a>
    <a href="index.html"><button type="button" class="btn btn-primary">Home</button></a>
  	</div>	
  	</div>
        <br>
        <form action="sterge_hotel.jsp" method="post">
            <table border="1" align="center">
                <tr>
                    <th><b>Mark:</b></th>
                    <th><b>IdHotel:</b></th>
                    <th><b>Nume:</b></th>
                    <th><b>Locatie:</b></th>
                    <th><b>Rating:</b></th>
                    <th><b>Data Construire:</b></th>
                </tr>
                <%
                    jb.connect();
                    ResultSet rs = jb.vedeTabela("hotel");
                    long x;
                    while (rs.next()) {
                        x = rs.getInt("idhotel");
                %>
                <tr>
                    <td><input type="checkbox" name="primarykey" value="<%= x%>" /></td><td><%= x%></td>
                    <td><%= rs.getString("nume")%></td>
                    <td><%= rs.getString("locatie")%></td>
                    <td><%= rs.getInt("rating")%></td>
                    <td><%= rs.getString("dataconstruire")%></td>
                    <%
                        }
                    %>
                </tr>
            </table><br/>
            <p align="center">
                <input type="submit" class = "btn btn-danger" value="Sterge">
            </p>
        </form>
        <%
            rs.close();
            jb.disconnect();
        %>      
    </body>
</html>

