const express = require('express');
const mongoose = require('mongoose');

//app configuration
  const app = express();
  const port = 3001;


  //listeners
  app.listen(port , ()=>{
      console.log(`listening on port ${port}`);
      }
  )
  mongoose.connect("mongodb+srv://devidevika9982:qv0WPh1lm0obdaGE@cluster0.8bhjimg.mongodb.net/Node-Api?retryWrites=true&w=majority&appName=Cluster0")
      .then(() => {
       console.log(`listening on port ${port}`);
          console.log('Connected to mongodbDb');
      })
      .catch(()=>{
          console.log('Connection Failed');
      });

      const UserSchema = new mongoose.Schema({
            name :String,
            age : Number
      });

      const UserModel = mongoose.model("users" , UserSchema);

      //api routes
      app.get('/api/getUsers', (req, res) =>{
         UserModel.find({}).then(function(users){
             res.json(users)
          }).catch(function(error){
              console.log(error)
          })

      });