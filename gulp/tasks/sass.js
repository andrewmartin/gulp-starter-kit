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