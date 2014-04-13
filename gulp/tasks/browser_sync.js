var gulp = require("gulp"),
  browserSync = require('browser-sync');

module.exports = function() {
  browserSync.init([
    'public/css/*.css'
  ], {

  });
};