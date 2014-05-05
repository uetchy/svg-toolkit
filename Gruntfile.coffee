# svgo input.svg --disable convertPathData --disable mergePaths --pretty -o output.svg

module.exports = (grunt) ->
  'use strict'

  # Initialize config
  grunt.initConfig
    pkg: grunt.file.readJSON('package.json')
    dir:
      src: 'src'
      dist: 'dist'

    # Cleaning
    clean:
      dist:
        src: '<%= dir.dist %>/**/*.svg'

    # Watching files
    watch:
      svg:
        files: '<%= dir.src %>/**/*.svg',
        tasks: ['svgmin']

    svgmin:
      options:
        plugins: [
          { convertPathData: false }
          { mergePaths: false }
        ]
      dist:
        files: [
          expand: true
          cwd: '<%= dir.src %>'
          src: ['**/*.svg']
          dest: '<%= dir.dist %>'
          ext: '.min.svg'
        ]

  # Load global tasks
  grunt.loadNpmTasks 'grunt-svgmin'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-clean'

  # Register tasks
  grunt.registerTask 'default', ['svgmin']
