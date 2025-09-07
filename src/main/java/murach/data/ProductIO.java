package murach.data;

import java.io.*;
import java.util.*;
import murach.business.Product;

public class ProductIO {
    
    public static Product getProduct(String code, String filepath) {
        try {
            Product p = new Product();
            File file = new File(filepath);
            BufferedReader in = new BufferedReader(new FileReader(file));
            
            String line = in.readLine();
            while (line != null) {
                StringTokenizer t = new StringTokenizer(line, "|");
                String productCode = t.nextToken();
                if (code.equalsIgnoreCase(productCode)) {
                    String description = t.nextToken();
                    String priceAsString = t.nextToken();
                    double price = Double.parseDouble(priceAsString);
                    p.setCode(code);
                    p.setDescription(description);
                    p.setPrice(price);
                    break;
                }
                line = in.readLine();
            }
            in.close();
            return p;
        } catch (IOException ioe) {
            System.err.println(ioe);
            return null;
        }
    }
    
    public static ArrayList<Product> getProducts(String filepath) {
        ArrayList<Product> products = new ArrayList<Product>();
        File file = new File(filepath);
        try {
            BufferedReader in = new BufferedReader(new FileReader(file));
            String line = in.readLine();
            while (line != null) {
                StringTokenizer t = new StringTokenizer(line, "|");
                String code = t.nextToken();
                String description = t.nextToken();
                String priceAsString = t.nextToken();
                double price = Double.parseDouble(priceAsString);
                
                Product p = new Product();
                p.setCode(code);
                p.setDescription(description);
                p.setPrice(price);
                products.add(p);
                line = in.readLine();
            }
            in.close();
            return products;
        } catch (IOException ioe) {
            System.err.println(ioe);
            return null;
        }
    }
}
