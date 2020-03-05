<%-- 
    Document   : index
    Created on : 03/03/2020, 14:14:16
    Author     : Home
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    </head>
    <body>
        
         <%
            String driver = "org.apache.derby.jdbc.ClientDriver";
            String url = "jdbc:derby://localhost:1527/webpao";
            String username = "root";
            String password = "root";
            String nomeProduto = request.getParameter("cod_cat");

            try {
                Class.forName(driver);
                Connection connection = DriverManager.getConnection(url, username, password);
                Statement statement = connection.createStatement();
                
                String query = "SELECT * FROM produtos where cod_cat_produto = " +
                        nomeProduto;
                ResultSet resultados = statement.executeQuery(query);
                
                while (resultados.next()) {  
                       out.println("<h1>Produto:</h1>");
                       out.println(resultados.getString("nome_produto")+"\"<br>");
                       out.println("<h1>Descricao:</h1>");
                       out.println(resultados.getString("desc_produto")+"\"");
                       out.println("<h1>Valor:</h1>");
                       out.println(resultados.getString("valor_produto")+"\"");
                       out.println("<h1>Caminho:</h1>");
                       out.println(resultados.getString("img_produto")+"\"");
                       
                    }
               
                connection.close();
            } catch (ClassNotFoundException cnfe) {
                out.println("error loading driver"+cnfe);
            }catch(SQLException sqle){
                out.println("Error with connection "+ sqle);
            }

        %>
       
    </body>
</html>
