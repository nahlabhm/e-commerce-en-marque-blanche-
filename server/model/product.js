const mongoose = require("mongoose");
const ratingSchema = require("./rating");
const commentSchema = require("./comment");

const productSchema = mongoose.Schema({
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
  price: {
    type: Number,
    required: true,
  },
  category: {
    type: String,
    required: true,
  },
  brand: {
    type: String,
    required: true,

  },
  model : {
    type: String,
    required: true,

  },
  color: {
    type: String,
   
  },
  style: {
    type: String,
    required: true,

  },
  screenSize: {
    type: String,
    required: true,

  },
  specialFeature: {
    type: String,
    required: true,

  },
  manufacturer : {
    type: String,
    required: true,

  }, 

  ratings: [ratingSchema],

  comments: [commentSchema],

  relatedProduct:[
    {
      type:mongoose.Schema.Types.ObjectId,
      ref:"RelatedProduct"
    }
  ]

});

const Product = mongoose.model("Product", productSchema);
module.exports = { Product, productSchema };