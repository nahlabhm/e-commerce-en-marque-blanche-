
const express = require("express");
const adminRouter = express.Router();
const admin = require("../middlewares/admin");
const { Product } = require("../model/product");
const Order = require("../model/order");
const Client = require("../model/boutique");
const { PromiseProvider } = require("mongoose");

// Add product
adminRouter.post("/admin/add-product", admin, async (req, res) => {
    try {
      const { name, description, images, quantity, price,manufacturer, category,brand,model,specialFeature,color,style,screenSize} = req.body;
      let product = new Product({
        name,
        description,
        images,
        quantity,
        price,
        category,
        brand,
        color,
        model,
        screenSize,
        style,
        specialFeature,
  manufacturer,
      });
      product = await product.save();
      res.json(product);
    } catch (e) {
      res.status(500).json({ error: e.message });
    }
  });
// Update product
adminRouter.put("/admin/products/:productId", admin, async (req, res) => {
  try {
    const productId = req.params.productId;
    const { name, description, images, quantity, price, category } = req.body;
    let product = await Product.findById(productId);
    if (!product) {
      return res.status(404).json({ error: "Product not found" });
    }
    product.name = name;
    product.description = description;
    product.images = images;
    product.quantity = quantity;
    product.price = price;
    product.category = category;
    product = await product.save();
    res.json(product);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});
  // Get all your products
adminRouter.get("/admin/get-products", admin, async (req, res) => {
  try {
    const products = await Product.find({});
    res.json(products);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});
  // Get all your products
  adminRouter.get("/admin/get-boutiques", admin, async (req, res) => {
    try {
      const boutiques = await Client.find({});
      res.json(boutiques);
    } catch (e) {
      res.status(500).json({ error: e.message });
    }
  });
// Delete the product
adminRouter.post("/admin/delete-product", admin, async (req, res) => {
  try {
    const { id } = req.body;
    let product = await Product.findByIdAndDelete(id);
    res.json(product);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

adminRouter.get("/admin/get-orders", admin, async (req, res) => {
  try {
    const orders = await Order.find({});
    res.json(orders);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

adminRouter.post("/admin/change-order-status", admin, async (req, res) => {
  try {
    const { id, status } = req.body;
    let order = await Order.findById(id);
    order.status = status;
    order = await order.save();
    res.json(order);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});
// Delete the product
adminRouter.post("/admin/delete-boutique", admin, async (req, res) => {
  try {
    const { id } = req.body;
    let boutique = await Client.findByIdAndDelete(id);
    res.json(boutique);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});
adminRouter.get("/admin/analytics", admin, async (req, res) => {
  try {
    const orders = await Order.find({});
    let totalEarnings = 0;

    for (let i = 0; i < orders.length; i++) {
      for (let j = 0; j < orders[i].products.length; j++) {
        totalEarnings +=
          orders[i].products[j].quantity * orders[i].products[j].product.price;
      }
    }
    // CATEGORY WISE ORDER FETCHING
    let mobileEarnings = await fetchCategoryWiseProduct("Mobiles");
    let ElectronicsEarnings = await fetchCategoryWiseProduct("Electronics");
    let ClothingEarnings = await fetchCategoryWiseProduct("Clothing");
    let BeautyEarnings = await fetchCategoryWiseProduct("Beauty");
    let BooksEarnings = await fetchCategoryWiseProduct("Books");
    let BabyEarnings = await fetchCategoryWiseProduct("Baby");
    let IndustrialEarnings = await fetchCategoryWiseProduct("Industrial");
    let SoftwareEarnings = await fetchCategoryWiseProduct("Software");
    let AutomotiveEarnings = await fetchCategoryWiseProduct("Automotive");
    let HomeEarnings = await fetchCategoryWiseProduct("Home");
    let JewelryEarnings = await fetchCategoryWiseProduct("Jewelry");
    let SportsEarnings = await fetchCategoryWiseProduct("Sports");
    let SuppliesEarnings = await fetchCategoryWiseProduct("Supplies");

    let earnings = {
      totalEarnings,
      mobileEarnings,
      ElectronicsEarnings,
      ClothingEarnings,
      BeautyEarnings,
      BooksEarnings,
      BabyEarnings,
      IndustrialEarnings,
      SoftwareEarnings,
      AutomotiveEarnings,
      HomeEarnings,
      JewelryEarnings,
      SportsEarnings,
      SuppliesEarnings,
    };

    res.json(earnings);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

async function fetchCategoryWiseProduct(category) {
  let earnings = 0;
  let categoryOrders = await Order.find({
    "products.product.category": category,
  });

  for (let i = 0; i < categoryOrders.length; i++) {
    for (let j = 0; j < categoryOrders[i].products.length; j++) {
      earnings +=
        categoryOrders[i].products[j].quantity *
        categoryOrders[i].products[j].product.price;
    }
  }
  return earnings;
}

  module.exports = adminRouter;