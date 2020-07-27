var botui = new BotUI('flight-bot');
/*
var mysql = require('mysql');

var dest = "city" , src ="city" , date = "none" , pcount = 0, pid = "0", pname ="none" ;

var con = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "gowreesh",
  database: "flightdb"
});
*/
botui.message
  .bot('Where would you like to travel?')
  .then(function () {
    return botui.action.button({
      delay: 1000,
      action: [{
        text: 'Mumbai',
        value: 'Mumbai'
      }, {
        text: 'Delhi',
        value: 'Delhi'
      },{
		 text: 'Chennai',
		  value: 'Chennai'
	  }]
    })
}).then(function (res) {
	dest = res.value;
	 botui.message
    .bot({
      delay: 500,
      content: 'From where do you travel?'
    })
    return botui.action.button({
      delay: 1000,
      action: [{
        text: 'Chennai',
        value: 'Chennai'
      },{
        text: 'Delhi',
        value: 'Delhi'
      },{
		 text: 'Mumbai', 
		 value: 'Mumbai'
	  }]
  })
}).then (function (res2){
	src = res2.value;
	 botui.message
    .bot({
      delay: 500,
      content: 'When do you want to travel?'
    })
	return botui.action.button({
	delay: 1000,
	action:[{
		text: '10-Feb-2020',
		value: '2020-02-10'
	},{
		text: '11-Feb-2020',
		value: '2020-02-11'
	},{
		text: '12-Feb-2020',
		value: '2020-02-12'
	}]
	})
}).then(function (res){
	date = res.value;
	 botui.message
    .bot({
      delay: 500,
      content: 'Please visit again'
    })
});
/*
var displayflights = function () {
	
con.connect(function(err) {
  if (err) throw err;
  //Select all customers and return the result object:
  con.query("SELECT * FROM flight", function (err, result, fields) {
    if (err) throw err;
    console.log(result);
  });
});

  botui.message
    .bot({
      delay: 500,
      content: 'Please choose flights below:'
    })
    .then(function (result) {
      return botui.action.button({
        delay: 1000,
        action: [{
		  text: result[0].name+'--'+result[0].number+'--'+result[0].source+'--'+result[0].destination+'--'+result[0].status,
          value: result[0].id // show the saved address if any
        },]
      })
    }).then(function (res) {
 
      return botui.action.button({
        delay: 1000,
        action: [{
          icon: 'check',
          text: 'Confirm',
          value: 'confirm'
        }, {
          icon: 'close',
          text: 'Cancel',
          value: 'cancel'
        }]
      })
    }).then(function (res) {
      if(res.value == 'confirm') {
        end();
      } else {
        displayflights();
      }
    });
}*/
