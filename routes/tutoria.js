var express = require('express');
var Web3 = require('web3')
var solc = require('solc')
var fs = require('fs')
var router = express.Router();

var web3 = new Web3(new Web3.providers.HttpProvider("http://localhost:8545"));


router.get('/login', function (req, res, next) {
  res.render('login', {});
});

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
module.exports = router;