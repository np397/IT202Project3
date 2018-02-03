<%@ page import="java.sql.*" %>
<%
    
    Connection con = null;
    String url = "jdbc:mysql://sql2.njit.edu/np397";
    String username = "np397";
    String password = "password";
    
    
    
    try{
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection(url,username,password);
    }
    catch(Exception e){
        out.println(e.toString());
    }
%>
<%
    String novelName  = request.getParameter("novelName");
    String author = request.getParameter("author");
    String genre = request.getParameter("genre");
    String mainCharacter = request.getParameter("mainCharacter");
    String rating = request.getParameter("rating");
    String action = request.getParameter("choice");
    Statement sm1 = null;
    sm1 = con.createStatement();
    
    if(action.equals("insert")){
        String query1;
        query1 = "INSERT INTO noveltitles VALUES('"+novelName+"','"+author+
                 "','"+genre+"','"+mainCharacter+"','"+rating+"')";
        sm1.executeUpdate(query1);
        out.println("The data has been successfully added to the table.");
    }
    else{
        String query2;
        query2 = "DELETE FROM noveltitles WHERE NovelName = '"+ novelName +"'";
        sm1.executeUpdate(query2);   
        out.println("The '"+ novelName +"' record is deleted from the table.");
    }

    Statement sm = null;
    ResultSet rs = null;
    sm = con.createStatement();
    
    String query;
    query = "Select * FROM noveltitles";
    rs = sm.executeQuery(query);
%>

<html>
    <head>
        <title>Novel Records</title>  
        <style>
            table,tr{
                border: 2px solid black;
                font-size: 20px;
                width:100%;
            }
            td{
                border: 2px solid black;
                font-size: 18px;
                width:140px;
            }
        </style>
    </head>
    <body>
        <form action="index.html">
            <input type="submit" value="Go Back To Main Page"><br>
            <table>
                <tr><th colspan="5">Novel Records</th><br></tr>
                <tr><th>Novel Name</th><th>Author</th><th>Genre</th><th>Main Character</th><th>Rating/Reviews</th></tr>
                <% while(rs.next()){ %>
                <tr>
                <td><%= rs.getString("NovelName") %></td>
                <td><%= rs.getString("Author") %></td>
                <td><%= rs.getString("Genre") %></td>
                <td><%= rs.getString("MainCharacter") %></td>
                <td><%= rs.getString("Rating") %></td>
                </tr>
                <%}%>
            </table>
        </form>
    </body>
<html>
<%
    rs.close();
    sm.close();
    con.close();
%>