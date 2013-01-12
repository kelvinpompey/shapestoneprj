
/*
 * GET home page.
 */

exports.index = function(req, res){
	var sections = ["Project", "People", "Team Board"];
  res.render('welcome', { title: 'ShapeStone' });
};