var Db  = require('./dboperations');
var Order = require('./order');
const operations = require('./dboperations');

var express = require('express');
var bodyParser = require('body-parser');
var cors = require('cors');
var app = express();
var router = express.Router();

app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());
app.use(cors());
app.use('/api', router);


router.use((request,response,next)=>{
   console.log('middleware');
   next();
})


router.route('/orders').get((request,response)=>{

     operations.getOrders().then(result => {
       response.json(result);
    })

})

router.route('/orders/:id').get((request,response)=>{

    operations.getOrder(request.params.id).then(result => {
       response.json(result);
    })

})

router.route('/orders').post((request,response)=>{

    let order = {...request.body}

    operations.addOrder(order).then(result => {
       response.status(201).json(result);
    })

})

router.route('/orders/:id').put((request,response)=>{

    let order = {...request.body}

    operations.updateOrder(order).then(result => {
       response.status(201).json(result);
    })

})
router.route('/orders/:id').delete((request,response)=>{

   try {
           const eventId = request.params.id;
           const deletedEvent =  operations.deleteOrder(eventId);
          response.json({ message: 'Order deleted successfully' });
       } catch (err) {
         response.status(500).send({ message: err.message });
       }

 })


var port = process.env.PORT || 8090;
app.listen(port);
console.log('Order API is running at ' + port);
