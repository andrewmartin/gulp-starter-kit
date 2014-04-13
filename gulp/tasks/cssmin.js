var cssmin = require('gulp-cssmin'),
  rename = require('gulp-rename');

module.exports = function() {
  return gulp.task('cssmin', ['sass'], function() {
    gulp.src('public/css/application.css')
      .pipe(cssmin())
      .pipe(rename('application.min.css'))
      .pipe(gulp.dest('public/css'));

    // optional separate vendor.css file
    // gulp.src('public/css/vendor.css')
    //   .pipe(cssmin())
    //   .pipe(rename('vendor.min.css'))
    //   .pipe(gulp.dest('public/css'));
  });

}