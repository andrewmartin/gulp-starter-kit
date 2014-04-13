var concat = require('gulp-concat'),
  CONF = require('../config');

module.exports = function() {

  return gulp.task("concat_app", ['coffee'], function() {
    return gulp.src(CONF.files.concat_app)
      .pipe(concat("application.js"))
      .pipe(gulp.dest("public/js"));
  });
}