Gulp Starter Kit
================

A simple Gulp starter kit using a modular approach.

This project allows you to get up and running with [Gulp](http://gulpjs.com/), quite possibly the most powerful build tool out there.

This project uses a modular approach to handling both the definition of tasks as well as configuration.

### Installation:

Pretty much:

`$ npm install`
`$ bower install`

Should cover it.

## Available Tasks:

Available tasks are found in the `gulp/config.js` file:

``` js config.js
tasks: [
  'sass',
  'cssmin',
  'coffee',
  'concat_app',
  'uglify_app',
  'concat_vendor',
  'uglify_app',
  'uglify_vendor',
  'browser_sync'
],
```

### Task Definitions:

Tasks are placed into the `./gulp/tasks` directory, and are abstracted out by file name. There are two options for defining a task:

1. Return the `gulp.src` object directly:

``` js sass.js
var gulp = require('gulp'),
  notify = require('gulp-notify'),
  sass = require('gulp-sass');

module.exports = function() {

  return gulp.src('assets/stylesheets/application.scss')
    .pipe(sass({
      sourceComments: 'map'
    })).on('error', notify.onError({
      message: '<%= error.message %>',
      title: 'SASS Error'
    }))
    .pipe(gulp.dest('public/css'));

};
```

2. For more complex operations, return a `gulp.task` definition. This becomes necessary when you are attempting to define a dependency array.

_Be sure to name the task the exact same name as the filename. The way this project is set up, it won't work otherwise._

``` js uglify_app.js
var uglify = require('gulp-uglify'),
  CONF = require('../config'),
  rename = require('gulp-rename');

module.exports = function() {
  return gulp.task('uglify_app', ['coffee', 'concat_app'], function() {
    gulp.src('public/js/application.js')
      .pipe(uglify())
      .pipe(rename('application.min.js'))
      .pipe(gulp.dest('public/js'));
  });
}
```

### Available `gulp` tasks

#### `gulp`
Compile all styles/scripts and watch for changes.

#### `gulp build`
Compile and minify all scripts.

#### `gulp clean`
Clear out the `public/` directory, which houses all files and scripts.


> This project was deeply inspired by some [clever work done by Dan Tello](http://viget.com/extend/gulp-browserify-starter-faq).