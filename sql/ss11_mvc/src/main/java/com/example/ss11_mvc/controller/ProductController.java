package com.example.ss11_mvc.controller;

import com.example.ss11_mvc.model.Product;
import com.example.ss11_mvc.service.ServiceProduct;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/products")
public class ProductController extends HttpServlet {
    private ServiceProduct serviceProduct = new ServiceProduct();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                request.getRequestDispatcher("/create.jsp").forward(request, response);
                break;
            case "update":
                int id = Integer.parseInt(request.getParameter("id"));
                Product product = serviceProduct.search(id);
                request.setAttribute("product", product);
                request.getRequestDispatcher("/update.jsp").forward(request, response);
                break;
            case "delete":
                break;
            case "search":
                break;
            default:
                List<Product> productList = serviceProduct.findAll();
                request.setAttribute("productList", productList);
                request.getRequestDispatcher("/product_list.jsp").forward(request, response);
                break;
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                add(request,response);
                break;
            case "update":
                update(request,response);
                break;
            case "delete":
                delete(request,response);
                break;
            case "search":
                break;
            default:
                  break;
        }
    }

    private void update(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        String describe = request.getParameter("describe");
        String manufacturer = request.getParameter("manufacturer");
        Product p = new Product(id, name, price, describe, manufacturer);
        serviceProduct.edit(p);
        response.sendRedirect("/products");
    }

    private void delete(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int deleteId =Integer.parseInt(request.getParameter("deleteId"));
        serviceProduct.delete(deleteId);
        response.sendRedirect("/products?massage=delete");
    }

    private void add(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        String describe = request.getParameter("describe");
        String manufacturer = request.getParameter("manufacturer");
        Product p = new Product(name, price, describe, manufacturer);
        serviceProduct.add(p);
        response.sendRedirect("/products");
    }
}