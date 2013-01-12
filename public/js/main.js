require.config({
    baseUrl: '/js',
    paths: {
        'jquery': 'libs/jquery-1.8.3.min',
        'jqueryui': 'libs/jquery-ui',
        'underscore':'libs/lodash',
        'backbone': 'libs/backbone',
        'knockout': 'libs/knockout-2.2.0',
        'sammy': 'libs/sammy',
        'coffee-script': 'libs/coffee-script',
        'text':'libs/text',
        'cs':'libs/cs',
		'shapestone':'shapestone'
    }
});

require(['cs!router']);