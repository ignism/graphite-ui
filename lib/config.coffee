module.exports =
  apply: () ->
    applySyntaxThemeColoring = (useSyntaxColors) ->
      fs = require 'fs'
      path = require 'path'
      varsPath = path.join __dirname, '..', 'stylesheets/config.less'

      if useSyntaxColors
        fs.writeFileSync varsPath, "@import \"colors-syntax\";\n"
      else
        fs.writeFileSync varsPath, "@import \"colors\";\n"

    atom.workspaceView.ready ->
      applySyntaxThemeColoring(atom.config.get('graphite-ui.syntaxThemeColoring'))

    atom.config.onDidChange 'graphite-ui.syntaxThemeColoring', ->
      applySyntaxThemeColoring(atom.config.get('graphite-ui.syntaxThemeColoring'))
