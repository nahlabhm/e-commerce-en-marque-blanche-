

const nodemailer = require("nodemailer");

transport = nodemailer.createTransport({
    host: "sandbox.smtp.mailtrap.io",
    port: 2525,
    auth: {
      user: "6636415b3098e7",
      pass: "ffbd1cc95f579d"
    }
  });