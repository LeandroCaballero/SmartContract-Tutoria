var express = require('express');
var Web3 = require('web3')
var solc = require('solc')
var fs = require('fs')
var router = express.Router();

//TODO: Cambiar uri por configuracion
var web3 = new Web3(new Web3.providers.HttpProvider("http://localhost:8545"));


router.get('/inicio', function (req, res, next) {
  res.render('index', {});
});

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

//router.get('/contrato', function(req, res, next) {
//    var web3 = new Web3(new Web3.providers.HttpProvider("http://localhost:8545"));
//    var code = fs.readFileSync('tutoria.sol').toString() //Su archivo del contrato inteligente
//
//    var compiledCode = solc.compile(code)
//    var abiDefinition = JSON.parse(compiledCode.contracts[':Tutoria'].interface) //Su contrato inteligente
//    var byteCode = compiledCode.contracts[':Tutoria'].bytecode //Su contrato inteligente
//    var TutoriaContract = new web3.eth.Contract(abiDefinition,{data: byteCode, from: web3.eth.accounts[0], gas: 4700000})
//    TutoriaContract.deploy({data:byteCode}).send({from:'0xff7cbcb3bae4b13db50860a023e31f4a0b0bfa46',gas: 6721975, gasPrice: '1000'});
//    var a = TutoriaContract.options.address
//    res.send(a);
//});

module.exports = router;