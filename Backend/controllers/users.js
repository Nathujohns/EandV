const express = require('express')
const db = require('../models')
const router = express.Router()
const cryptojs = require('crypto-js')
require('dotenv').config()
const bcrypt = require('bcrypt')

router.post("/addUser", async(req, res) => {

    const [newUser, created] = await db.user.findOrCreate({where:{cpr:req.body.cpr, name: req.body.name,email:req.body.email}})
  
    if(!created){
      res.status(400).send('Looks like you already have an account! Try logging in')
    } else {
        const lowerCaseUserName = req.body.email.toLowerCase();
        newUser.email = lowerCaseUserName;
        const hashedPassword = bcrypt.hashSync(req.body.password, 10)
        newUser.password = hashedPassword
        newUser.role = req.body.role
  
        await newUser.save()
        .then(async (volunteer) => {
      
          res.status(200).send({
            code: 200,
            message: "User added successfully",
            addeduser: newUser,
          });
              
      })
    }
     
  });

router.post("/loginUser", async(req, res) => {

    const user = await db.user.findOne({where: {email: req.body.email.toLowerCase()}})
    if(!user){
      res.status(400).send('User not found!')
    } else if(!bcrypt.compareSync(req.body.password, user.password)) {
        res.status(400).send('Invalid email/password!')
    } else {
        console.log('logging in the user!!!')
        const encryptedUserId = cryptojs.AES.encrypt(user.id.toString(), process.env.SECRET)
        const encryptedUserIdString = encryptedUserId.toString()
        res.cookie('userId', encryptedUserIdString)
        res.cookie('userID' , user.id)
        res.send(user)
    }
})


router.get("/getUser", async(req, res) => {

  const user = await db.user.findAll({})

  res.status(200).send({
    allusers: user,
  });

})

module.exports = router