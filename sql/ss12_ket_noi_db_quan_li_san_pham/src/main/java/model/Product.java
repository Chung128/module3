package model;

public class Product {
    private int id;
    private String name;
    private double price;
    private String describe;
    private String manufacturer;
    private int category;

    public Product(int id, String name, double price, String describe, String manufacturer, int category) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.describe = describe;
        this.manufacturer = manufacturer;
        this.category = category;
    }

    public Product(String name, double price, String describe, String manufacturer, int category) {
        this.name = name;
        this.price = price;
        this.describe = describe;
        this.manufacturer = manufacturer;
        this.category = category;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getDescribe() {
        return describe;
    }

    public void setDescribe(String describe) {
        this.describe = describe;
    }

    public String getManufacturer() {
        return manufacturer;
    }

    public void setManufacturer(String manufacturer) {
        this.manufacturer = manufacturer;
    }

    public int getCategory() {
        return category;
    }

    public void setCategory(int category) {
        this.category = category;
    }
}
