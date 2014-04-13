var gulp = require("gulp");

module.exports = function(tasks) {
  tasks.forEach(function(name) {
    return gulp.task(name, require("./tasks/" + name));
  });
  return gulp;
};