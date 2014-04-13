var gulp = require('gulp'),
  coffee = require('gulp-coffee'),
  notify = require('gulp-notify');

module.exports = function() {

  return gulp.src('assets/scripts/**/*.coffee')
    .pipe(coffee({
      bare: false
    }))
    .on('error', notify.onError({
      message: '<%= error.message %>',
      title: 'Coffee Error'
    }))
    .pipe(gulp.dest('assets/scripts'));

};