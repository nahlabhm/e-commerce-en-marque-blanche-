
const express = require("express");
const clientRouter = express.Router();
const client = require("../middlewares/client");
const { Productclient } = require("../model/add_clientproduct");



// Add product
clientRouter.post("/client/add-product", client, async (req, res) => {
  try {
    const { name, description, images, quantity, price, sku } = req.body;
    let productclient = new Productclient({
      name,
      description,
      images,
      quantity,
      price,
      sku,
    });
    productclient = await productclient.save();
    res.json(productclient);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

clientRouter.put("/client/products/:productId", client, async (req, res) => {
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
  clientRouter.get("/client/get-products", client, async (req, res) => {
  try {
    const products = await Product.find({});
    res.json(products);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});
// Delete the product
clientRouter.post("/client/delete-product", client, async (req, res) => {
  try {
    const { id } = req.body;
    let product = await Product.findByIdAndDelete(id);
    res.json(product);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});


clientRouter.get("/client/get-orders", client, async (req, res) => {
  try {
    const orders = await Order.find({});
    res.json(orders);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

clientRouter.post("/client/change-order-status", client, async (req, res) => {
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

  module.exports = clientRouter;