<%-- 
    Document   : menu
    Created on : 28/02/2020, 21:20:03
    Author     : Home
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <a href="index.jsp">Inicio</a>
        <%
            String driver = "org.apache.derby.jdbc.ClientDriver";
            String url = "jdbc:derby://localhost:1527/webpao";
            String username = "root";
            String password = "root";

            try {
                Class.forName(driver);
                Connection connection = DriverManager.getConnection(url, username, password);
                Statement statement = connection.createStatement();
                
                String query = "SELECT * FROM categoria_produto";
                ResultSet resultados = statement.executeQuery(query);
                
                while (resultados.next()) {                        
                        out.println("<a href=\"produtos.jsp?cod_cat=");
                        out.println(resultados.getString("codigo_categoria")+"\">");
                        out.println(resultados.getString("nome_categoria")+"</a>");
                    }
                connection.close();
            } catch (ClassNotFoundException cnfe) {
                out.println("error loading driver"+cnfe);
            }catch(SQLException sqle){
                out.println("Error with connection "+ sqle);
            }

        %>
        <a href="carriho.jsp">Meu Carrinho</a><br/>
    </body>
</html>
