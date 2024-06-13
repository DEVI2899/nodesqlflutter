 var config = require('./dbConfig');
 const sql = require('mssql/msnodesqlv8');


async function connectToDb() {
  try {
    await sql.connect(config);
    console.log('Connected to SQL Server database');
  } catch (error) {
    console.error('Error connecting to SQL Server:', error);
  }
}




 async function getOrders() {
     try {
         let pool = await sql.connect(config);
         let products = await pool.request().query("SELECT * from orders");
         return products.recordset;
     }
     catch (error) {
         console.log(error);
     }
 }

 async function getOrder(orderId) {
     try {
         let pool = await sql.connect(config);
         let product = await pool.request()
             .input('input_parameter', sql.Int, orderId)
             .query("SELECT * from Orders where Id = @input_parameter");
         return product.recordset;

     }
     catch (error) {
         console.log(error);
     }
 }


 async function addOrder(order) {

     try {
         let pool = await sql.connect(config);
         let insertProduct = await pool.request()
             .input('Id', sql.Int, order.Id)
             .input('Title', sql.NVarChar, order.Title)
             .input('Quantity', sql.Int, order.Quantity)
             .input('Message', sql.NVarChar, order.Message)
             .input('City', sql.NVarChar, order.City)
             //.query('INSERT INTO Orders (Id, Title, Quantity, Message, City) OUTPUT INSERTED.* VALUES (@Id, @Title, @Quantity, @Message, @City)');
             .execute('SpInsertOrder');
         return insertProduct.recordsets;
     }
     catch (err) {
         console.log(err);
     }
}

     async function updateOrder(order) {

          try {
              let pool = await sql.connect(config);
              let updateProduct = await pool.request()
                  .input('Id', sql.Int, order.Id)
                  .input('Title', sql.NVarChar, order.Title)
                  .input('Quantity', sql.Int, order.Quantity)
                  .input('Message', sql.NVarChar, order.Message)
                  .input('City', sql.NVarChar, order.City)
                  .query('UPDATE orders SET Title = @Title, Quantity = @Quantity, Message= @Message, City = @City OUTPUT INSERTED.* WHERE Id = @Id');
                  //.execute('SpInsertOrder');

              return updateProduct.recordsets;
          }
          catch (err) {
              console.log(err);
          }

 }
 async function deleteOrder(Id) {
         try {
             const pool = await sql.connect(config);;
             await pool.request()
                 .input('Id', sql.Int, Id)
                 .execute('DeleteOrders');
             return true;
         } catch (err) {
              Error(err.message);
         }
     }







 module.exports = {
     connectToDb:connectToDb,
     getOrders: getOrders,
     getOrder : getOrder,
     addOrder : addOrder,
     updateOrder: updateOrder,
     deleteOrder :deleteOrder
 }