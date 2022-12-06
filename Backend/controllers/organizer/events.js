const express = require('express'),
router = express.Router(),
db = require('../../models'),
sequelize = require('sequelize')

router.get('/' , async (req, res) => {

    try {
      let user = await db.user.findByPk(res.locals.userId)
  
      if(user == null){
        return res.redirect('/')
      }
  
  if(req.body.userId !== undefined){
    if(user.role !== 'restaurant') {
      return res.redirect('/')
    }
  }
    } catch (error) {
      req.flash('error', error)
    }
    
    db.order.findAll({
          where: {
            status: {[sequelize.Op.not]: 'completed'}
          },
          order: [['createdAt', 'DESC']],
          include: [db.user]
        }).then((orders) => {
          if(req.xhr) {
              return res.json(orders)
          } else {
           return res.render('restaurant/orders' , {orders})
          }
        });
   })
  
router.post('/editevent' ,async(req, res) => {
  
  let values = {title: req.body.title,description: req.body.description,eventDate: req.body.eventDate,members: req.body.members};
    
  let condition = { where :{id: req.body.id}}; 
  
    await db.event.update(values,condition).then(async () => {
    res.send("Event updated successfully")  
  })
})
router.delete('/:eventId', async (req,res) => {
  
   await db.event.destroy({where: { id: req.params.eventId }}).then(r => {  
   res.send('Event deleted successfully!!!')});
})
   

router.post("/addevent", async(req, res) => {

    const eventData = {
      title: req.body.title,
      description: req.body.description,
      eventDate: req.body.eventDate,
      members: req.body.members
    };
  
    let addNewEvent = await db.event.create(eventData)
  
    if(!addNewEvent){
      res.status(400).send('Event not created due to an error , try again later..')
    }
  else{
    await addNewEvent.save()
    .then(async (orders) => {
  
      res.send(addNewEvent);})
    }

  });
  

router.get("/getEvent", async(req, res) => {
  
    let eventAllData = await db.event.findAll({})
    res.send(eventAllData)
    // res.status(200).send({ code: "200", eventData: eventAllData });
   
});

module.exports = router;
