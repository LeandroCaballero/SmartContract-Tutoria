var createError = require('http-errors');
var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');
var Web3 = require('web3')
var solc = require('solc')
var fs = require('fs')


var web3 = new Web3(new Web3.providers.HttpProvider("http://localhost:8545"));
var code = fs.readFileSync('tutoria.sol').toString() //Su archivo del contrato inteligente

var compiledCode = solc.compile(code)
var abiDefinition = JSON.parse(compiledCode.contracts[':Tutoria'].interface) //Su contrato inteligente
var byteCode = compiledCode.contracts[':Tutoria'].bytecode //Su contrato inteligente
var TutoriaContract = new web3.eth.Contract(abiDefinition,{data: byteCode, from: web3.eth.accounts[0], gas: 4700000})
TutoriaContract.deploy({data:byteCode}).send({from:'0xff7cbcb3bae4b13db50860a023e31f4a0b0bfa46',gas: 6721975, gasPrice: '1000'}) //address de quien deploya, alumno para solicitar tutoria

//myContract = new web3.eth.Contract(abiDefinition,'0xa5877e9ce8fb5e87340bab7d6305e23538f1a125', {data:byteCode,gasPrice:'20000000000'}); //address del contrato
//
//myContract.methods.solicitar('0xbf965026809eeda78bd15e66ed185220fbc44c0b','Paradigmas').send({ from: '0xff7cbcb3bae4b13db50860a023e31f4a0b0bfa46', gas: 200000 }) //primer address: profesor, segundo address: alumno
//myContract.methods.getMateria('0xff7cbcb3bae4b13db50860a023e31f4a0b0bfa46').call().then(console.log)
//myContract.methods.getAlumno('0xff7cbcb3bae4b13db50860a023e31f4a0b0bfa46').call().then(console.log)
//myContract.methods.getProfesor('0xff7cbcb3bae4b13db50860a023e31f4a0b0bfa46').call().then(console.log)
//
//myContract.methods.estaConfirmado('0xff7cbcb3bae4b13db50860a023e31f4a0b0bfa46').call().then(console.log)
//myContract.methods.estaCancelado('0xff7cbcb3bae4b13db50860a023e31f4a0b0bfa46').call().then(console.log)
////myContract.methods.confirmar('0xff7cbcb3bae4b13db50860a023e31f4a0b0bfa46').send({ from: '0xbf965026809eeda78bd15e66ed185220fbc44c0b', gas: 200000 })
//myContract.methods.cancelar('0xff7cbcb3bae4b13db50860a023e31f4a0b0bfa46').send({ from: '0xff7cbcb3bae4b13db50860a023e31f4a0b0bfa46', gas: 200000 })


//routers
var inicioRouter = require('./routes/inicio');
var usersRouter = require('./routes/users');
var leandroRouter = require('./routes/leandro');
var tutoriaRouter = require('./routes/tutoria');


var app = express();

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'jade');

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));

app.use('/inicio', inicioRouter);
app.use('/users', usersRouter);
app.use('/leandro', leandroRouter);
app.use('/tutoria', tutoriaRouter);

// catch 404 and forward to error handler
app.use(function(req, res, next) {
  next(createError(404));
});

// error handler
app.use(function(err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render('error');
});

module.exports.abi = abiDefinition;
module.exports.byte = byteCode;
module.exports = app;