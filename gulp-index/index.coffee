gulp = require("gulp")
module.exports = (tasks) ->
  tasks.forEach (name) ->
    gulp.task name, require("./tasks/" + name)

  gulp
