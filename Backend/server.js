const express = require('express');
db = require('./models'),
cryptojs = require('crypto-js'),
app = express(),
port = 3000,
bcrypt = require('bcrypt'),
require('dotenv').config()



app.use(express.json());
app.use(
  express.urlencoded({
    extended: true,
  })
);

app.get('/', (req, res) => {
  res.send('Hello World!')
})

// const eventAllData = [];

app.post("/api/addevent", async(req, res) => {
  console.log("Result", req.body);

  const singleEventData = {
    title: req.body.title,
    description: req.body.description,
    eventDate: req.body.eventDate
  };

  // eventAllData.push(singleEventData);
  await db.event.create(singleEventData)
  .then(async (orders) => {

    res.status(200).send({
      code: 200,
      message: "Event added successfully",
      addedevent: singleEventData,
    });
        
})
  
});

app.post("/api/addUser", async(req, res) => {

  const [newUser, created] = await db.volunteer.findOrCreate({where:{cpr:req.body.cpr, name: req.body.name,email:req.body.email}})
  console.log("THE NEW USER IS " , newUser)
  if(!created){
      res.send('Looks like you already have an account! Try logging in')
  } else {
      const lowerCaseUserName = req.body.email.toLowerCase();
      newUser.email = lowerCaseUserName;
      const hashedPassword = bcrypt.hashSync(req.body.password, 10)
      newUser.password = hashedPassword

      await newUser.save()
      .then(async (volunteer) => {
    
        res.status(200).send({
          code: 200,
          message: "User added successfully",
          addeduser: newUser,
        });
            
    })
  }

  // eventAllData.push(singleEventData);
   
});

app.post("/api/loginUser", async(req, res) => {

    const user = await db.volunteer.findOne({where: {email: req.body.email.toLowerCase()}})
    if(!user){
        res.send("User not found!")
    } else if(!bcrypt.compareSync(req.body.password, user.password)) {
        res.send("Invalid email/password!")
    } else {
        console.log('logging in the user!!!')
        const encryptedUserId = cryptojs.AES.encrypt(user.id.toString(), process.env.SECRET)
        const encryptedUserIdString = encryptedUserId.toString()
        // res.cookie('userId', encryptedUserIdString)
        // res.cookie('userID' , user.id) 
        res.send("Successfully signed in !")

    }
})

app.get("/api/getEvent", async(req, res) => {
  
    let eventAllData = await db.event.findAll({})
    res.send(eventAllData)
    // res.status(200).send({ code: "200", eventData: eventAllData });
   
});

app.listen(process.env.PORT || 3000, ()=> console.log(`🎧You're listening to the smooth sounds of port ${process.env.PORT || 3000}🎧`));