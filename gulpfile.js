var watch = require('gulp-watch'),
  _ = require('./node_modules/underscore'),
  clean = require('gulp-clean'),
  CONF = require('./gulp/config');

gulp = require('./gulp')(CONF.tasks);

gulp.task('watch', function() {

  gulp.watch([
    'assets/stylesheets/**/*.scss'
  ], [
    'sass'
  ]);

  gulp.watch([
    '**/*.coffee'
  ], [
    'coffee',
    'concat_app'
  ]);;

});

gulp.task('log', function(arg) {
  console.log('log', arg);
});

gulp.task('clean', function() {
  gulp.src(['public/**/*', 'assets/scripts/**/*.js'], {
    read: false
  })
    .pipe(clean());
});

gulp.task('compile', [
  'coffee',
  'sass'
]);

gulp.task('compress', [
  'coffee',
  'sass',
  'concat_app',
  'concat_vendor',
  'uglify_app',
  'uglify_vendor',
  'cssmin'
]);

gulp.task('build', [
  'compile',
  'compress'
]);

gulp.task('default', [
  'compile',
  'compress',
  'browser_sync',
  'watch'
]);