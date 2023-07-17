const mongoose = require("mongoose");
const ratingSchema = require("./rating");
const commentSchema = require("./comment");

const productboutiqueSchema = mongoose.Schema({
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
  promotion: {
    type: Number,
 

  },
  marque : {
    type: String,
    required: true,

  },
  color: {
    type: String,
   
  },
  materiau: {
    type: String,
    required: true,

  },
  screenSize: {
    type: String,
    required: true,

  },
  country: {
    type: String,
    required: true,

  },
  livraison : {
    type: Number,
    required: true,

  }, 

  ratings: [ratingSchema],

  comments: [commentSchema],

});

const Productboutique = mongoose.model("Productboutique", productboutiqueSchema);
module.exports = { Productboutique, productboutiqueSchema };