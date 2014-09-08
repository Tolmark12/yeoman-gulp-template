"use strict"
util   = require("util")
path   = require("path")
yeoman = require("yeoman-generator")
yosay  = require("yosay")

YoGulpGenerator = yeoman.generators.Base.extend(
  initializing: ->
    @pkg = require("../package.json")
    return

  prompting: ->
    
    # Have Yeoman greet the user.
    @log yosay("Welcome to our gulp js app generator")
    # done = @async()
    # prompts = [ {type: "confirm", name:    "installJquery", message: "Want to install Jquery?", default: true} ]
    # @prompt prompts, ( (props) ->
    #   @installJquery = props.installJquery
    #   @log String(@installJquery)
    #   done()
    #   return
    # ).bind(this)
    return

  writing:
    app: ->
      @dest.mkdir "app"
      @dest.mkdir "app/coffee"
      @dest.mkdir "app/coffee/components"
      @dest.mkdir "app/images"
      @dest.mkdir "app/jade"
      @dest.mkdir "app/scss"
      @dest.mkdir "stage"
      # Basics
      @src.copy "_gitignore",                 ".gitignore"
      @src.copy "_gulpfile.js",               "gulpfile.js"
      @src.copy "_gulpfile.coffee",           "gulpfile.coffee"
      @src.copy "_bower.json",                "bower.json"
      @src.copy "_bowerrc.json",              ".bowerrc"
      @src.copy "_package.json",              "package.json"

      # App
      @src.copy "app/_Main.coffee",           "app/coffee/Main.coffee"
      @src.copy "app/_main.scss",             "app/scss/main.scss"
      @src.copy "app/_vars-and-utils.scss",   "app/scss/_vars-and-utils.scss"
      @src.copy "app/_example.jade",          "app/jade/example.jade"

      # Stage
      @src.copy "stage/init.coffee",          "stage/init.coffee"
      @src.copy "stage/stage.jade",           "stage/stage.jade"
      @src.copy "stage/stage.scss",           "stage/stage.scss"
      return

    projectfiles: ->
      # @src.copy "editorconfig", ".editorconfig"
      # @src.copy "jshintrc", ".jshintrc"
      return

  end: ->
    @installDependencies()
    return
)
module.exports = YoGulpGenerator