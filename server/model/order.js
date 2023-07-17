const mongoose = require("mongoose");
const { productSchema } = require("./product");
const paytSchema = require("./payement");

const orderSchema = mongoose.Schema({
  products: [
    {
      product: productSchema,
      quantity: {
        type: Number,
        required: true,
      },
    },
  ],
  totalPrice: {
    type: Number,
    required: true,
  },
  address: {
    type: String,
    required: true,
  },
  telephone: {
    type: Number,
    required: true,
  },
  username: {
    type: String,
    required: true,
  },
  userId: {
    required: true,
    type: String,
  },
  orderedAt: {
    type: Number,
    required: true,
  },
  status: {
    type: Number,
    default: 0,
  },
  card: {
    type: Number,
    required: true,
  },
  cv: {
    type: Number,
    required: true,
  },
  
  createdAt: {
    type: String,

    required: true,

  },});

module.exports = mongoose.model("Order", orderSchema);
