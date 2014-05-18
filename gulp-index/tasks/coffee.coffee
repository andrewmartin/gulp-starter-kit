gulp = require("gulp")
coffee = require("gulp-coffee")
notify = require("gulp-notify")
gutil = require('gulp-util');
browserify = require('gulp-browserify')
rename = require('gulp-rename')

module.exports = ->
  gulp.task 'coffee', ->

    gulp.src('assets/scripts/index.coffee', { read: false })
    .pipe browserify
      transform: ['coffeeify']
      extensions: ['.coffee']
      debug: !gulp.env.production
    .pipe rename('application.js')
    .pipe gulp.dest('./public/js')