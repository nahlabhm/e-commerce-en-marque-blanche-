const jwt = require("jsonwebtoken");
const Client = require("../model/boutique");

const client = async (req, res, next) => {
  try {
    const token = req.header("x-auth-token");
    if (!token)
      return res.status(401).json({ msg: "No auth token, access denied" });

    const verified = jwt.verify(token, "passwordKey");
    if (!verified)
      return res
        .status(401)
        .json({ msg: "Token verification failed, authorization denied." });
    const client = await Client.findById(verified.id);
    if (client.type == "client" || client.type == "seller") {
      return res.status(401).json({ msg: "You are not an admin!" });
    }
    req.client = verified.id;
    req.token = token;
    next();
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};

module.exports = client;