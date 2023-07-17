const express = require("express");
const mongoose = require("mongoose");
const authRouter=require("./routes/auth");
const adminRouter =require("./routes/admin");
const productRouter = require("./routes/product");
const userRouter = require("./routes/user");
mongoose.set("strictQuery", false);

// INIT
const PORT = process.env.PORT || 3000 ;
const app = express();
const DB = "mongodb+srv://nahlabenhajmabrouk:nahla12696@cluster0.vful67f.mongodb.net/?retryWrites=true&w=majority";

//mideleware
app.use(express.json());
app.use(authRouter);
app.use(adminRouter);
app.use(productRouter);
app.use(userRouter);



// Connections
mongoose
  .connect(DB)
  .then(() => {
    console.log("Connection Successful");
  })
  .catch((e) => {
    console.log(e);
  });

app.listen(PORT, "0.0.0.0", () => {
  console.log(`connected at port ${PORT}`);
});

let pageSize = 10;
