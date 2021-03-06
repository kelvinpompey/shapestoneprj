
/**
 * Module dependencies.
 */

var express = require('express')
  , routes = require('./routes')
  , user = require('./routes/user')
  , taskboard = require('./routes/taskboard')
  , projectRoute = require('./routes/project')
  , activityRoute = require('./routes/activity')
  , mongoose = require('mongoose')
  , http = require('http')
  , path = require('path');

var app = express();

app.configure(function(){
  app.set('port', process.env.PORT || 3030);
  app.set('views', __dirname + '/views');
  app.set('view engine', 'jade');
  app.use(express.favicon());
  app.use(express.logger('dev'));
  app.use(express.bodyParser());
  app.use(express.methodOverride());
  app.use(app.router);
  app.use(express.static(path.join(__dirname, 'public')));
});

app.configure('development', function(){
  app.use(express.errorHandler());
});

app.get('/', routes.index);
app.get('/projects', projectRoute.index); 
app.get('/activities', activityRoute.index); 
app.get('/taskboard', taskboard.index);
app.get('/users', user.list);

var db = mongoose.connect('mongodb://localhost/shapestonedb').connection;
db.on('open', function(){
    console.log('connection open');
}); 
http.createServer(app).listen(app.get('port'), function(){
  console.log("Express server listening on port " + app.get('port'));
});
