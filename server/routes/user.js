
const express = require("express");
const userRouter = express.Router();
const auth = require("../middlewares/auth");
const { Product } = require("../model/product");
const User = require("../model/user");
const Order = require("../model/order");
const Client = require("../model/boutique");
const {Productboutique} = require("../model/product_client");
const Employe = require("../model/employe");

userRouter.post("/api/add-to-cart", auth, async (req, res) => {
    try {
      const { id } = req.body;
      const product = await Product.findById(id);
      let user = await User.findById(req.user);
  
      if (user.cart.length == 0) {
        user.cart.push({ product, quantity: 1 });
      } else {
        let isProductFound = false;
        for (let i = 0; i < user.cart.length; i++) {
          if (user.cart[i].product._id.equals(product._id)) {
            isProductFound = true;
          }
        }
  
        if (isProductFound) {
          let producttt = user.cart.find((productt) =>
            productt.product._id.equals(product._id)
          );
          producttt.quantity += 1;
        } else {
          user.cart.push({ product, quantity: 1 });
        }
      }
      user = await user.save();
      res.json(user);
    } catch (e) {
      res.status(500).json({ error: e.message });
    }
  });
  userRouter.delete("/api/remove-from-cart/:id", auth, async (req, res) => {
    try {
      const { id } = req.params;
      const product = await Product.findById(id);
      let user = await User.findById(req.user);
  
      for (let i = 0; i < user.cart.length; i++) {
        if (user.cart[i].product._id.equals(product._id)) {
          if (user.cart[i].quantity == 1) {
            user.cart.splice(i, 1);
          } else {
            user.cart[i].quantity -= 1;
          }
        }
      }
      user = await user.save();
      res.json(user);
    } catch (e) {
      res.status(500).json({ error: e.message });
    }
  });
  userRouter.put("/api/profile", auth, async (req, res) => {
    try {
      const { name, email, password, address } = req.body;
  
      // Check if user exists
      let user = await User.findById(req.user._id);
      if (!user) {
        return res.status(404).json({ error: "User not found" });
      }
  
      // Update user profile fields
      if (name) user.name = name;
      if (email) user.email = email;
      if (password) {
        const hashedPassword = await bcryptjs.hash(password, 8);
        user.password = hashedPassword;
      }
      if (address) user.address = address;
  
      // Save updated user profile
      user = await user.save();
      res.json(user);
    } catch (e) {
      res.status(500).json({ error: e.message });
    }
  });
// save user address
userRouter.post("/api/save-user-address", auth, async (req, res) => {
  try {
    const {  address, } = req.body;
    let user = await User.findById(req.user);
    user.address = address;
    user = await user.save();
    res.json(user);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

// save user address
userRouter.post("/api/payment", auth, async (req, res) => {
    try {
      const { id, card ,cv,name,createdAt} = req.body;
      let order = await Order.findById(id);
  
      const paytSchema = {
        card,
        cv,
        name,
        createdAt,
      };
  
      order.payment.push(paytSchema);
      order = await order.save();
      res.json(product);
    } catch (e) {
      res.status(500).json({ error: e.message });
    }
  });

// order product
userRouter.post("/api/order", auth, async (req, res) => {
  try {
    const { cart, totalPrice, address,username, telephone,card,cv,createdAt} = req.body;
    let products = [];

    for (let i = 0; i < cart.length; i++) {
      let product = await Product.findById(cart[i].product._id);
      if (product.quantity >= cart[i].quantity) {
        product.quantity -= cart[i].quantity;
        products.push({ product, quantity: cart[i].quantity });
        await product.save();
      } else {
        return res
          .status(400)
          .json({ msg: `${product.name} is out of stock!` });
      }
    }

    let user = await User.findById(req.user);
    user.cart = [];
    user = await user.save();

    let order = new Order({
      products,
      totalPrice,
      address,
      username,
      telephone,
      cv,
      card,
      createdAt,
      userId: req.user,
      orderedAt: new Date().getTime(),
    });
    order = await order.save();
    res.json(order);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

  // Get all your products
  userRouter.get("/user/get-orders", auth, async (req, res) => {
    try {
      const orders = await Order.find({});
      res.json(orders);
    } catch (e) {
      res.status(500).json({ error: e.message });
    }
  });
userRouter.post("/user/add-boutique", auth, async (req, res) => {
  try {
    const { nameboutique, address, images, bio, following, category, numero } = req.body;
    let boutique = new Client({
      nameboutique,
      address,
      images,
      bio,
      following,
      category,
      numero,
    });
    boutique = await boutique.save();
    res.json(boutique);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

// Update product
userRouter.put("/user/boutique/:boutiqueId", auth, async (req, res) => {
  try {
    const boutiqueId = req.params.boutiqueId;
    const { nameboutique, address, images, bio, following, category,numero } = req.body;
    let boutique = await Client.findById(boutiqueId);
    if (!boutique) {
      return res.status(404).json({ error: "Product not found" });
    }
    boutique.nameboutique = nameboutique;
    boutique.address = address;
    boutique.images = images;
    boutique.bio = bio;
    boutique.following = following;
    boutique.category = category;
    boutique.numero = numero;
    boutique = await boutique.save();
    res.json(boutique);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});
  // Get all your products
userRouter.get("/user/get-boutiques", auth, async (req, res) => {
  try {
    const boutiques = await Client.find({});
    res.json(boutiques);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});
// Delete the product
userRouter.post("/user/delete-boutique", auth, async (req, res) => {
  try {
    const { id } = req.body;
    let boutique = await Client.findByIdAndDelete(id);
    res.json(boutique);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});
userRouter.get("/api/boutique/search/:nameboutique", auth, async (req, res) => {
  try {
    const boutiques = await Client.find({
      nameboutique: { $regex: req.params.nameboutique, $options: "i" },
    });

    res.json(boutiques);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

userRouter.get("/api/boutique/me", auth, async (req, res) => {
  try {
    const boutiques = await Client.find({ userId: req.user });
    res.json(boutiques);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

userRouter.get("/api/brands/", auth, async (req, res) => {
  try {
    const boutiques = await Client.find({ category: req.query.category });
    res.json(boutiques);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});
// Add product
userRouter.post("/user/add-product", auth, async (req, res) => {
  try {
    const { name, description, images, quantity, price,
       category,promotion,marque,materiau,color,screenSize,country,livraison} = req.body;
    let productsclient = new Productboutique({
      name,
      description,
      images,
      quantity,
      price,
      category,
      promotion,
      color,
      marque,
      screenSize,
      materiau,
      country,
      livraison,
    });
    productsclient = await productsclient.save();
    res.json(productsclient);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

// Get all your products
userRouter.get("/user/get-products", auth, async (req, res) => {
try {
  const productsclient = await Productboutique.find({});
  res.json(productsclient);
} catch (e) {
  res.status(500).json({ error: e.message });
}
});

// Delete the product
userRouter.post("/user/delete-product", auth, async (req, res) => {
  try {
    const { id } = req.body;
    let productsclient = await Productboutique.findByIdAndDelete(id);
    res.json(productsclient);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});
// create a post request route to rate the product.
userRouter.post("/api/rate-product", auth, async (req, res) => {
  try {
    const { id, rating } = req.body;
    let productsclient = await Productboutique.findById(id);

    for (let i = 0; i < productsclient.ratings.length; i++) {
      if (productsclient.ratings[i].userId == req.user) {
        productsclient.ratings.splice(i, 1);
        break;
      }
    }

    const ratingSchema = {
      userId: req.user,
      rating,
    };

    productsclient.ratings.push(ratingSchema);
    productsclient = await productsclient.save();
    res.json(productsclient);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

userRouter.post("/user/add-employe", auth, async (req, res) => {
  try {
    const { name, email, password, address, type, telephone } = req.body;
    
    let employe = new Employe({
      name,
      email,
      password,
      type,
      address,
      telephone,
    });
    employe = await employe.save();
    res.json(employe);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

  userRouter.get("/user/get-employe", auth, async (req, res) => {
    try {
      const employe = await Employe.find({});
      res.json(employe);
    } catch (e) {
      res.status(500).json({ error: e.message });
    }
    });
userRouter.post("/user/delete-employe", auth, async (req, res) => {
  try {
    const { id } = req.body;
    let employe = await Employe.findByIdAndDelete(id);
    res.json(employe);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});
userRouter.get("/user/analytics", auth, async (req, res) => {
  try {
    const boutiques = await Client.find({});
    let totalEarnings = 0;

    for (let i = 0; i < boutiques.length; i++) {
      for (let j = 0; j < boutiques[i].boutiqueId.length; j++) {
        totalEarnings +=
          boutiques[i].nameboutique[j];
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
  let categoryOrders = await Client.find({
    "boutiques.boutique.category": category,
  });

  for (let i = 0; i < categoryOrders.length; i++) {
    for (let j = 0; j < categoryOrders[i].boutiques.length; j++) {
      earnings +=
        categoryOrders[i].boutiques[j].boutiqueId ;
    }
  }
  return earnings;
}
  module.exports = userRouter;
