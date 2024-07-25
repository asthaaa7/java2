package model;

import java.io.File;


import javax.servlet.http.Part;
import utils.StringUtils;

public class ProductModel {
	private int productId;
    private String productName;
    private int unitPrice;
    private int stockQuantity;
    private String description;
    private String imageUrlFromPart;

    

    public ProductModel(int productId, String productName, int unitPrice, int stockQuantity, String description,
			Part imagePart) {
		super();
		this.productId = productId;
		this.productName = productName;
		this.unitPrice = unitPrice;
		this.stockQuantity = stockQuantity;
		this.description = description;
		this.imageUrlFromPart = getImageUrl(imagePart);	}


	public ProductModel(String productName, int unitPrice, String description, String imagePart) {
		super();
		this.productName = productName;
		this.unitPrice = unitPrice;
		this.description = description;
		this.imageUrlFromPart = imagePart;
		
	}
	
	public ProductModel() {
		
	}
	
    

	public ProductModel(String productName) {
		super();
		this.productName = productName;
	}

	public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public int getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(int unitPrice) {
        this.unitPrice = unitPrice;
    }

    public int getStockQuantity() {
        return stockQuantity;
    }

    public void setStockQuantity(int stockQuantity) {
        this.stockQuantity = stockQuantity;
    }

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getImageUrlFromPart() {
		return imageUrlFromPart;
	}
	public void setImageUrlFromPart(Part part) {
        this.imageUrlFromPart = getImageUrl(part); // Corrected invocation
    }
	

	public void setImageUrlFromDB(String imageUrl) {
		this.imageUrlFromPart = imageUrl;
	}
	
	private String getImageUrl(Part part) {
		// Define the directory path to store uploaded user images. This path should be configured elsewhere in the application.
	    String savePath =StringUtils.IMAGE_ROOT_PATH;

	    // Create a File object representing the directory to store uploaded images.
	    File fileSaveDir = new File(savePath);

	    // Initialize the variable to store the extracted image file name.
	    String imageUrlFromPart = null;

	    // Check if the directory to store uploaded images already exists.
	    if (!fileSaveDir.exists()) {
	        // If the directory doesn't exist, create it.
	    	// user mkdirs() method to create multiple or nested folder
	        fileSaveDir.mkdir();
	    }

	    // Get the Content-Disposition header from the request part. This header contains information about the uploaded file, including its filename.
	    String contentDisp = part.getHeader("content-disposition");
	 // Split the Content-Disposition header into individual parts based on semicolons.
	    String[] items = contentDisp.split(";");

	    // Iterate through each part of the Content-Disposition header.
	    for (String s : items) {
	        // Check if the current part starts with "filename" (case-insensitive trim is used).
	        if (s.trim().startsWith("filename")) {
	            // Extract the filename from the current part.
	            // The filename is assumed to be enclosed in double quotes (").
	            // This part removes everything before the equal sign (=) and the double quotes surrounding the filename.
	            imageUrlFromPart = s.substring(s.indexOf("=") + 2, s.length() - 1);
	            break; // Exit the loop after finding the filename
	        }
	    }

	    // If no filename was extracted from the Content-Disposition header, set a default filename.
	    if (imageUrlFromPart == null || imageUrlFromPart.isEmpty()) {
	        imageUrlFromPart = "default_user.jpg";
	    }

	    // Return the extracted or default image file name.
	    return imageUrlFromPart;
	}
	
}
