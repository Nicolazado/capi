<%-- 
    Document   : validar
    Created on : 9 de set. de 2024, 18:44:40
    Author     : Mommys
--%>


<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.ResultSet" %>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Valida o usuário no BD</title>
    </head>

    <body>
        <% String u, s;
            Connection conn;
            ResultSet resultado;
            /*Recebe o usuário e senha digitados
            no formulário*/ u = request.getParameter("usuario");
            s = request.getParameter("senha");
            /*Conectar com o banco de dados*/ Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/capibara", "root", "");
            /* Busca o usuario e senha digitado, na tabela iusers do BD*/ PreparedStatement st = conn.prepareStatement("SELECT * FROM usuarios WHERE usuario=? AND senha=?");
            st.setString(1, u);
            st.setString(2, s);
            resultado = st.executeQuery();
            /*executa o
            select*/ if (resultado.next()) {
                /*se encontrou o ususario*/
                response.sendRedirect("logado.jsp?nome=" + resultado.getString("nome"));
            } else {
                out.print("Usuário e/ou senha Usuário ");
            }


        %>    
    </body>
</html>
