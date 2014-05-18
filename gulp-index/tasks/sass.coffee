gulp = require("gulp")
notify = require("gulp-notify")
sass = require("gulp-sass")
plumber = require("gulp-plumber")
module.exports = ->
  gulp.task 'sass', ->
    gulp.src("assets/stylesheets/application.scss")
    .pipe(plumber())
    # .pipe sass()
    .pipe(sass(
      sourceComments: "map"
      errLogToConsole: true
      )
    )
    .pipe gulp.dest("public/css")
