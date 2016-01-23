var express = require('express');
var DB = require('../modules/DBconnection');
var router = express.Router();

router.route('/')
    .get(function(req, res, next) { 
		var connection = DB.openConnection();   
		//JOIN routeHasPoints ON routes.id = routeHasPoints.routeId JOIN points ON points.id = routeHasPoints.pointId
		connection.query('SELECT * FROM routes', function(err, rows, fields) {
			if (err) throw err;		
			res.locals.items = rows;
			res.locals.processed = true;
			connection.end();
			next();
		});	
    })
    .post(function(req,res,next) {	   		
		var connection = DB.openConnection();   
		connection.query('INSERT INTO routes SET ?', req.body, function(err, result) {
			if (err) throw err;		
			
			connection.query('SELECT * FROM routes WHERE routes.id=' + result["insertId"], function(err, rows, fields) {
				if (err) throw err;		
				res.locals.items = rows;
				res.locals.processed = true;
				connection.end();
				next();
			});	
		});	
    })
    .all(function(req, res, next) {
        if (res.locals.processed) {
            next();
        } else {
            // reply with wrong method code 405
            var err = new Error('this method is not allowed at ' + req.originalUrl);
            err.status = 405;
            next(err);
        }
    });

router.route('/:id')
    .get(function(req, res, next) {
		var connection = DB.openConnection();   
		connection.query('SELECT * FROM routes WHERE routes.id=' + req.params.id, function(err, rows, fields) {
			if (err) throw err;		
			res.locals.items = rows;
			res.locals.processed = true;
			next();
		});	
		connection.end();
    })
    .put(function(req, res,next) {
        
    })
    .delete(function(req,res,next) {
        
    })
    .patch(function(req,res,next) {

    })

    .all(function(req, res, next) {
        if (res.locals.processed) {
            next();
        } else {
            // reply with wrong method code 405
            var err = new Error('this method is not allowed at ' + req.originalUrl);
            err.status = 405;
            next(err);
        }
    });

// this middleware function can be used, if you like or remove it
// it looks for object(s) in res.locals.items and if they exist, they are send to the client as json
router.use(function(req, res, next){
    // if anything to send has been added to res.locals.items
    if (res.locals.items) {
        // then we send it as json and remove it
        res.json(res.locals.items);
        delete res.locals.items;
    } else {
        // otherwise we set status to no-content
        res.set('Content-Type', 'application/json');
        res.status(204).end(); // no content;
    }
});

module.exports = router;
