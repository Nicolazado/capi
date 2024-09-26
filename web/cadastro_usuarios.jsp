<%-- 
    Document   : cadastro_usuarios
    Created on : 16 de set. de 2024, 10:29:50
    Author     : evandro.cteruel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            Connection conn;
            PreparedStatement st;
            String n, s, u;
            //Receber os dados digitados no formulário de cadastro
            n = request.getParameter("nome");
            u = request.getParameter("usuario");
            s = request.getParameter("senha");
            //Conectar com o banco de dados
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/capibara", "root", "");
            //Salvar os dados recebido na tabela users do BD
            st = conn.prepareStatement("INSERT INTO usuarios VALUES(?,?,?)");
            st.setString(1, n);
            st.setString(2, u);
            st.setString(3, s);
            st.executeUpdate(); //Executa o INSERT na tabela
            out.print("Usuário cadastrado com sucesso");
        %>
        <p>
            <a href="index.html"> Logar </a>
        </p>
    </body>
</html>
