var express = require('express');
var router = express.Router();
let BlockChain = require("../Block/blockChain")
let Transaccion = require("../Block/transaccion")

var url = require('url-parse')

var tutoria = new BlockChain();

/* GET users listing. */

router.get('/inicio', function (req, res, next) {
  res.render('index', {});
});


router.get('/', function (req, res, next) {

  res.json(tutoria);

});

router.get('/last', function (req, res, next) {
  res.json(tutoria.getLastBlock())
});

router.get('/formulario', function (req, res, next) {
  let query = url(req.url, true).query;
  res.render('formulario', {
    alumno: query.alumno,
    email: query.email,

    materia: query.materia,
    profesor: query.profesor,

    dia: query.dia
  });
});


router.post("/formulario/respuesta", function (req, res, next) {
  let alumno = req.body.alumno;
  let email = req.body.email;

  let materia = req.body.materia;
  let profesor = req.body.profesor;

  let dia = req.body.dia;

  var tran = new Transaccion(alumno, email, materia, profesor, dia);

  tutoria.addBlock(tran);
  res.render('respuesta', {});
});



module.exports = router;