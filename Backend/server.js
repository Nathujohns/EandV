const express = require('express');
db = require('./models'),
cryptojs = require('crypto-js'),
app = express(),
port = 3000,
bcrypt = require('bcrypt'),
require('dotenv').config(),
cookieParser = require('cookie-parser'),
session = require('express-session')

app.use(cookieParser())

app.use(session({ cookie: { maxAge: 900000 }, //15min  
    secret: 'SECSECRET',
    resave: false, 
    saveUninitialized: false
}));

app.use((req, res, next) => {
  res.locals.session = req.session
  res.locals.user = req.user
  next()
})

app.use(express.json());
app.use(
  express.urlencoded({
    extended: true,
  })
);

//app.use(async (req, res, next)=>{
//  if(req.cookies.userId) {
//      const decryptedId = cryptoJS.AES.decrypt(req.cookies.userId, process.env.SECRET)
//      const decryptedIdString = decryptedId.toString(cryptoJS.enc.Utf8)
//      const user = await db.user.findByPk(decryptedIdString)
//      res.locals.user = user;
//      res.locals.userId = user.id;
//  } else res.locals.user = null
//  next()
//})



app.use('/users', require('./controllers/users'))
app.use('/organizer', require('./controllers/organizer/events'))
// app.use('/volunteer', require('./controllers/volunteer/requests') )

app.listen(process.env.PORT || 3000, ()=> console.log(`🎧You're listening to the smooth sounds of port ${process.env.PORT || 3000}🎧 from 🇧🇭`));