const express = require('express'),
router = express.Router(),
moment = require('moment'),
db = require('../../models')

router.get('/requests', async(req, res) => {

  let user = await db.user.findByPk(res.locals.userId)
  

  if(user == null){
    return res.redirect('/')
  }

    if(req.body.userId !== undefined){
  if(user.role !== 'customer') {
    return res.redirect('/')
  }
}

  let userRequests = await res.locals.user.getOrders({order: [['createdAt', 'DESC']]})
  // console.log("USERORDERS ARE --> " , userOrders)

})

router.post('/requests', async (req, res) => {

          let user = res.locals.userId
          let eventAllData = await db.event.findAll({})

            await db.request.create({
            userId: user,
            eventId:eventAllData.id
          }, {include: [db.user]})
            
            .then(async (requests) => {

             res.send('Success')
              
              
          })

        })

    router.get('/orders/:id' , async (req, res) =>{
        const order = await db.order.findByPk(req.params.id);
        if(res.locals.userId === order.userId) {
        return res.render('customer/trackorder', { order })     
        }
      return res.redirect('/')     
    } )

    module.exports = router;