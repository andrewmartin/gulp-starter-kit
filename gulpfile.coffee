watch = require('gulp-watch')
_ = require('./node_modules/underscore')
clean = require('gulp-clean')
CONF = require('./gulp-index/config')
gulp = require('./gulp-index')(CONF.tasks)
es = require('event-stream')
gulp.task 'watch', ->
  gulp.watch ['assets/stylesheets/**/*.scss'], ['sass']

  gulp.watch ['**/*.coffee'], [
    'coffee'
  ]

  gulp.watch [
    'assets/images/**/*'
  ], ['copy']

gulp.task 'copy', ->
  es.merge(
    gulp.src([
      'assets/images/**/*'
    ])
    .pipe(gulp.dest('public/images'))
  )

gulp.task 'clean', ->
  gulp.src([
    'public/**/*'
    'assets/scripts/**/*.js'
  ],
    read: false
  ).pipe clean()

gulp.task 'compile', [
  'coffee'
  'sass'
  'concat_vendor'
]
gulp.task 'compress', [
  'uglify_app'
  'uglify_vendor'
  'cssmin'
]
gulp.task 'build', [
  'clean'
  'compile'
  'compress'
  'copy'
  'rev'
]
gulp.task 'default', [
  'build'
  'watch'
]