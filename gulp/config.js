// this is an array used to set configs dynamically from one place.

module.exports = {

  // all of the tasks we want to load.
  // these must be individual files in the tasks/ dir.
  tasks: [
    'sass',
    'cssmin',
    'coffee',
    'concat_app',
    'uglify_app',
    'concat_vendor',
    'uglify_app',
    'uglify_vendor'
    // 'browser_sync'
  ],

  // you can inject these file arrays as needed into the various gulp tasks.
  files: {

    // watch tasks
    watch: {
      concat: [],
      style: []
    },

    // concat vendor scripts tasks
    concat_vendor: [
      'assets/components/jquery/dist/jquery.js',
      'assets/components/twbs-bootstrap-sass/vendor/assets/javascripts/bootstrap/affix.js',
      'assets/components/twbs-bootstrap-sass/vendor/assets/javascripts/bootstrap/alert.js',
      'assets/components/twbs-bootstrap-sass/vendor/assets/javascripts/bootstrap/button.js',
      'assets/components/twbs-bootstrap-sass/vendor/assets/javascripts/bootstrap/carousel.js',
      'assets/components/twbs-bootstrap-sass/vendor/assets/javascripts/bootstrap/collapse.js',
      'assets/components/twbs-bootstrap-sass/vendor/assets/javascripts/bootstrap/dropdown.js',
      'assets/components/twbs-bootstrap-sass/vendor/assets/javascripts/bootstrap/modal.js',
      'assets/components/twbs-bootstrap-sass/vendor/assets/javascripts/bootstrap/tooltip.js',
      'assets/components/twbs-bootstrap-sass/vendor/assets/javascripts/bootstrap/popover.js',
      'assets/components/twbs-bootstrap-sass/vendor/assets/javascripts/bootstrap/scrollspy.js',
      'assets/components/twbs-bootstrap-sass/vendor/assets/javascripts/bootstrap/tab.js',
      'assets/components/twbs-bootstrap-sass/vendor/assets/javascripts/bootstrap/transition.js'
    ],

    // main concat files
    concat_app: [
      'assets/scripts/**/*.js'
    ]
  }


}