const mongoose = require("mongoose");
const { productboutiqueSchema } = require("./product_client");

const boutiqueSchema = mongoose.Schema({
    nameboutique: {
        required: true,
        type: String,
        trim: true,
      },
    address: {
      type: String,
      default: "",
    },
    images: [
      {
        type: String,
        required: true,
      },
    ],
    bio: {
      type: String,
      default: "",
    },
    numero: {
      type: String,
      default: "",
    },
    category: {
      type: String,
      required: true,
    },
    following: {
      type: String,
      
    },
   
   
     
  });

const Client = mongoose.model("Client", boutiqueSchema);
module.exports = Client;
