var express = require('express');
var router = express.Router();

/* GET users listing. */
router.get('/demo01', function(req, res, next) {
  res.render('demo01', { });
});

module.exports = router;
