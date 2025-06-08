package controller;


import model.Product;
import service.IServiceCategory;
import service.IServiceProduct;
import service.ServiceCategory;
import service.ServiceProduct;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/products")
public class ControllerProduct extends HttpServlet {
    private IServiceProduct serviceProduct = new ServiceProduct();
    private IServiceCategory serviceCategory=new ServiceCategory();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showFormAdd(request,response);
                break;
            case "update":
                showFormEdit(request,response);
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
                add(request, response);
                break;
            case "update":
                update(request, response);
                break;
            case "delete":
                delete(request, response);
                break;
            case "search":
                break;
            default:
                break;
        }
    }

    private void showFormAdd(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("categoryList", serviceCategory.findAll());
        RequestDispatcher dispatcher= req.getRequestDispatcher("create.jsp");
        dispatcher.forward(req,resp);
    }
    private void showFormEdit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        Product product = serviceProduct.findById(id);
        req.setAttribute("product", product);
        req.setAttribute("categoryList", serviceCategory.findAll());
        RequestDispatcher dispatcher= req.getRequestDispatcher("update.jsp");
        dispatcher.forward(req,resp);
    }
    private void update(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        String describe = request.getParameter("describe");
        String manufacturer = request.getParameter("manufacturer");
        int category = Integer.parseInt(request.getParameter("category"));
        Product p = new Product(id, name, price, describe, manufacturer,category);
        serviceProduct.edit(p);
        response.sendRedirect("/products");
    }

    private void delete(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int deleteId = Integer.parseInt(request.getParameter("deleteId"));
        serviceProduct.delete(deleteId);
        response.sendRedirect("/products?massage=delete");
    }

    private void add(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        String describe = request.getParameter("describe");
        String manufacturer = request.getParameter("manufacturer");
        int category = Integer.parseInt(request.getParameter("category"));
        Product p = new Product( name, price, describe, manufacturer,category);
        serviceProduct.add(p);
        response.sendRedirect("/products");
    }

}
