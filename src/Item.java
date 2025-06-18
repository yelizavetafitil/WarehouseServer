class Item {
    private String name;
    private int quantity;
    private String unit;
    private double price;
    private double volume;
    private String category; 
    private String warehouse; 

    public Item(String name, int quantity, String unit, double price, double volume, String category, String warehouse) {
        this.name = name;
        this.quantity = quantity;
        this.unit = unit;
        this.price = price;
        this.volume = volume;
        this.category = category;
        this.warehouse = warehouse;
    }

    // Геттеры для полей
    public String getName() { return name; }
    public int getQuantity() { return quantity; }
    public String getUnit() { return unit; }
    public double getPrice() { return price; }
    public double getVolume() { return volume; }
    public String getCategory() { return category; }
    public String getWarehouse() { return warehouse; }
}
