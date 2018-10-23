var express = require('express');
var Web3 = require('web3')
var solc = require('solc')
var fs = require('fs')
var router = express.Router();

var web3 = new Web3(new Web3.providers.HttpProvider("http://localhost:8545"));
var url = require('url-parse')

let app = require("../app")


//router.get('/login', function (req, res, next) {
//  res.render('login', {});
//});

router.get('/accounts', function(req, res, next) {

  web3.eth.getAccounts()
    .then(accounts => {

      var respuesta = 'Accounts en la blockchain';
      

      for (let index = 0; index < accounts.length; index++) {
        const a = accounts[index];
        
        respuesta += '<br />';
        respuesta += a.toString();
      }    
      
      res.send(respuesta);

    });
  
});
router.get('/last', function(req, res, next) {
  web3.eth.getBlockNumber()
    .then(number => {

      res.send(number.toString());

    });
});

//Metodos

router.get('/metodos', function (req, res, next) {
  let query = url(req.url, true).query;
  res.render('metodos', {
    usuario: query.usuario,
    materia: query.materia,
    profesor: query.profesor,

  });
});

router.post("/metodos/respuesta", function (req, res, next) {
  let metodo = req.body.metodo;

  
  console.log(metodo);
});
module.exports = router;

//Login
router.get('/login', function (req, res, next) {
  let query = url(req.url, true).query;
  res.render('login', {
    usuario: query.usuario,
    materia: query.materia,
    profesor: query.profesor,

  });
});

router.post("/login/respuesta", function (req, res, next) {
  let usuario = req.body.usuario;

  let materia = req.body.materia;
  let profesor = req.body.profesor;
  if(profesor == usuario){
    res.render('errorLogin',{});
    
  }else{
    console.log(usuario,materia,profesor)
    //console.log(app.abi)
    //console.log(app.byte)
    myContract = new web3.eth.Contract(app.abi,'0xa5877e9ce8fb5e87340bab7d6305e23538f1a125', {data:app.byte, gasPrice:'20000000000'}); //address del contrato
    myContract.methods.solicitar(profesor,'Paradigmas').send({ from: usuario, gas: 200000 })
    res.render('respuesta', {});
  }
});
module.exports = router;