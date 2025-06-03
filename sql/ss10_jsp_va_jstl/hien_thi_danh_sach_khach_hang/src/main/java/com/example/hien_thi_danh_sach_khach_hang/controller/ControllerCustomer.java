package com.example.hien_thi_danh_sach_khach_hang.controller;

import com.example.hien_thi_danh_sach_khach_hang.model.Customer;
import com.example.hien_thi_danh_sach_khach_hang.service.IServiceCustomer;
import com.example.hien_thi_danh_sach_khach_hang.service.ServiceCustomer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns="/customer")
public class ControllerCustomer extends HttpServlet {
    private static IServiceCustomer serviceCustomer=new ServiceCustomer();
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {}
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Customer> customers=serviceCustomer.findAll();
        req.setAttribute("customer",customers);
        req.getRequestDispatcher("/danh_sach_phong.jsp").forward(req, resp);
    }
}
