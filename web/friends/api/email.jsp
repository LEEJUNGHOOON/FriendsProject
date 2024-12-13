<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    request.setCharacterEncoding("UTF-8");
%>
<%@ page import="java.sql.*" %>
<%@ page import="main.java.com.javaex.vo.FriendVo" %>
<%@ page import="main.java.com.javaex.dao.FriendDaoImpl" %>
<%
    String email = request.getParameter("email");

    try {
        FriendDaoImpl dao = new FriendDaoImpl();

        if (dao.selectFriendByEmail(email)) {
            out.println("true");
        } else {
            out.println("false");
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
%>