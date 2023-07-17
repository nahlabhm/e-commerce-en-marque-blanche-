const express = require('express');
const Client = require('../model/boutique');
const bcryptjs = require('bcryptjs');
const jwt = require('jsonwebtoken');
const auth = require('../middlewares/auth');
const { mailTransport } = require('./mail');

const boutiqueRouter = express.Router();

// Sign Up Route
boutiqueRouter.post('/api/boutique/signup', async (req, res) => {
  try {
    const { name, email, password, address,bio, nameboutique } = req.body;

    const existingUser = await Client.findOne({ email });
if (existingUser) {
  return res.status(400).json({ msg: 'A client with the same email already exists.' });
}


    const hashedPassword = await bcryptjs.hash(password, 8);

    let client = new Client({
      email,
      password: hashedPassword,
      name,
      bio,
      nameboutique,
      address,
    });
    client = await client.save();

    const token = jwt.sign({ id: client._id }, 'passwordKey');
    mailTransport().sendMail({
      from: 'emailverification@gmail.com',
      to: client.email,
      subject: 'Verify your email account',
      html: `<h1>Click on this <a href="http://localhost:3000/verify-email?token=${token}">link</a> to verify your email address.</h1>`,
    });

    res.json(client);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

// Sign In Route
boutiqueRouter.post('/api/boutique/signin', async (req, res) => {
  try {
    const { email, password } = req.body;

    const client = await Client.findOne({ email });
    if (!client) {
      return res
        .status(400)
        .json({ msg: 'client with this email does not exist!' });
    }

    const isMatch = await bcryptjs.compare(password, client.password);
    if (!isMatch) {
      return res.status(400).json({ msg: 'Incorrect password.' });
    }

    const token = jwt.sign({ id: client._id }, 'passwordKey');
    res.json({ token, ...client._doc });
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

module.exports = boutiqueRouter;

