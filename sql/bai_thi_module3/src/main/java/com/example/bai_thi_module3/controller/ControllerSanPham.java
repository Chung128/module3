package com.example.bai_thi_module3.controller;


import com.example.bai_thi_module3.model.SanPham;
import com.example.bai_thi_module3.service.IServiceSanPham;
import com.example.bai_thi_module3.service.ServiceSanPham;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(value = "/sanphams")
public class ControllerSanPham extends HttpServlet {
    private IServiceSanPham serviceSanPham=new ServiceSanPham();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showFormAdd(request,response);
                break;
            default:
                List<SanPham> sanPhamList = serviceSanPham.findAll();
                request.setAttribute("sanPhamList", sanPhamList);
                request.getRequestDispatcher("list.jsp").forward(request, response);
                break;
        }
    }

    private void showFormAdd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/them.jsp");
        dispatcher.forward(request, response);
    }



    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                add(request, response);
                break;
            default:
                break;
        }
    }


    private void add(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String tensanPham = request.getParameter("tensanPham");
        int gia = Integer.parseInt(request.getParameter("gia"));
        int mucGiamGia = Integer.parseInt(request.getParameter("mucGiamGia"));
        int tonKho = Integer.parseInt(request.getParameter("tonKho"));

        SanPham sanPham = new SanPham( tensanPham,gia, mucGiamGia, tonKho);
        boolean isAddSuccess= serviceSanPham.add(sanPham);
        String message= isAddSuccess?"addSuccess":"addFailed";
        response.sendRedirect("/sanphams?message=" +message);
    }
}
