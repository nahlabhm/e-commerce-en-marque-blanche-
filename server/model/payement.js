const mongoose = require("mongoose");

const paytSchema = mongoose.Schema({
 
  card: {
    type: Number,
    required: true,
  },
  cv: {
    type: Number,
    required: true,
  },
  name: {
    type: String,
    required: true,
  },
  createdAt: {
    type: Date,
    default:'',
  },
}
);
module.exports = paytSchema;