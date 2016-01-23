var mysql = require("mysql");

var DB = {
	openConnection: function(){
		var connection = mysql.createConnection({
			host: "localhost",
			user: "root",
			password: "9Qj2r",
			database : 'mountainbuddy'
		});
		connection.connect(function(err){
			if(err){
				console.log('Error connecting to Db');
				return;
			}
			console.log('Mysql connection established');
		});
		return connection;
	}
}

module.exports = DB;
