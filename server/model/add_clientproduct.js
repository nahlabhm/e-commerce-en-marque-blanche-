const mongoose = require("mongoose");
const ratingSchema = require("./rating");
const commentSchema = require("./comment");

const productclientSchema = mongoose.Schema({
  name: {
    type: String,
    required: true,
    trim: true,
  },
  description: {
    type: String,
    required: true,
    trim: true,
  },
  images: [
    {
      type: String,
      required: true,
    },
  ],
  quantity: { 
    type: Number,
    required: true,
  },
  stock: { 
    type: Number,
    required: true,
  },
  
  sku: {
    type: String,
    required: true,
    trim: true,
  },
  createdAt: {
    type: Date,
    default: Date.now,
  },
  updatedAt: {
    type: Date,
    default: Date.now,
  },
  price: {
    type: Number,
    required: true,
  },
  status: {
    type: String,
    required: true,
    trim: true,
  },
  ratings: [ratingSchema],

  comments: [commentSchema],

});

const Productclient = mongoose.model("Productclient", productclientSchema);
module.exports = { Productclient, productclientSchema }; 