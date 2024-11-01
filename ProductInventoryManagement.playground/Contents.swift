import Foundation

struct Product {
    var name: String
    var price: Double
    var quantity: Int
    
    init(name: String, price: Double, quantity: Int) {
        self.name = name
        self.price = price
        self.quantity = quantity
    }
    
    // FUNCTION: Get total price of product based on its quantity
    func getInventoryValue() -> Double {
        return price * Double(quantity)
    }
}

struct ProductInventoryManagement {
    var products: [Product]

    init(products: [Product]) {
        self.products = products
    }
    
    // FUNCTION: Get total price of product based on its quantity
    func calculateTotalInventoryValue() -> Double {
        let totalValue = products.reduce(0) {
            $0 + $1.getInventoryValue()
        }
        
        return (totalValue * 100).rounded() / 100
    }

    // FUNCTION: Finds the product with the highest price
    func findMostExpensiveProduct() -> String? {
        return products.max(by: {
            $0.price < $1.price
        })?.name
    }

    // FUNCTION: Checks if a product with a specific name is in stock
    func isProductInStock(productName: String) -> Bool {
        return products.contains {
            $0.name.lowercased() == productName.lowercased() && $0.quantity > 0
        }
    }

    // FUNCTION: Sorts the products by price or quantity in ascending or descending order
    func sortProducts(by attribute: String, ascending: Bool) -> [Product] {
        let sortedProducts: [Product]
        
        switch attribute.lowercased() {
            case "price":
                sortedProducts = products.sorted {
                    ascending ? $0.price < $1.price : $0.price > $1.price
                }
            
            case "quantity":
                sortedProducts = products.sorted {
                    ascending ? $0.quantity < $1.quantity : $0.quantity > $1.quantity
                }
            
            default:
                print("Invalid sort option")
                return products
        }
        return sortedProducts
    }
}

let products = [
    Product(name: "Laptop", price: 999.99, quantity: 5),
    Product(name: "Smartphone", price: 499.99, quantity: 10),
    Product(name: "Tablet", price: 299.99, quantity: 0),
    Product(name: "Smartwatch", price: 199.99, quantity: 3)
]

let inventoryManager = ProductInventoryManagement(products: products)

print("---------")
print("Total Inventory Value: \(inventoryManager.calculateTotalInventoryValue())")
print("---------")
print("Most Expensive Product: \(inventoryManager.findMostExpensiveProduct() ?? "No products available")")
print("---------")
print("Is 'Headphones' in stock? \(inventoryManager.isProductInStock(productName: "Headphones"))")
print("---------")
print("Products sorted by price in descending order:")
inventoryManager.sortProducts(by: "price", ascending: false).forEach { product in
    print("\(product.name): $\(product.price)")
}
print("---------")
print("Products sorted by quantity in ascending order:")
inventoryManager.sortProducts(by: "quantity", ascending: true).forEach { product in
    print("\(product.name): quantity \(product.quantity)")
}
