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
  
router.post('/status' ,async(req, res) => {
  
  let values = {status: req.body.status, };
  let condition = { where :{id: req.body.id}}; 
  
    await db.order.update(values,condition)
    
    .then(async (orders) => {
  
      req.flash('success', 'Order updated successfully!!!')
      
      
      //Emit
      const eventEmitter = req.app.get('eventEmitter')
      eventEmitter.emit('orderUpdated', {id: req.body.id, status: req.body.status})
  
      // delete req.session.cart
      
      });   
      
      db.order.findAll({
        where: {
          status: {[sequelize.Op.not]: 'completed'}
        },
        order: [['createdAt', 'DESC']],
        include: [db.user]
      }).then((orders) => {
      
        res.render('restaurant/orders' , {orders})
  
      });
  })
    
router.delete('/:requestId', async (req,res) => {
  
  
   await db.order.destroy({
        where: { id: req.params.orderId }
    }).then(r => {
      
      
          req.flash('success', 'Order deleted successfully!!!')
  
         
      db.order.findAll({
        where: {
          status: {[sequelize.Op.not]: 'completed'}
        },
        order: [['createdAt', 'DESC']],
        include: [db.user]
      }).then((orders) => {
      
        res.render('restaurant/orders' , {orders})
  
      });
      
  
      
    });
  })
   

router.post("/addevent", async(req, res) => {

    const eventData = {
      title: req.body.title,
      description: req.body.description,
      eventDate: req.body.eventDate
    };
  
    let addNewEvent = await db.event.create(eventData)
  
    if(!addNewEvent){
      res.status(400).send('Event not created due to an error , try again later..')
    }
  else{
    await addNewEvent.save()
    .then(async (orders) => {
  
      res.status(200).send({
        code: 200,
        message: "Event added successfully",
        addedevent: eventData,
      });
          
  })
  }
   
    
  });
  

router.get("/getEvent", async(req, res) => {
  
    let eventAllData = await db.event.findAll({})
    res.send(eventAllData)
    // res.status(200).send({ code: "200", eventData: eventAllData });
   
});

module.exports = router;
