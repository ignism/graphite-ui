module.exports =
  config:
    syntaxThemeColoring:
      description: 'Color the UI using a seleciton of colors from the current syntax theme.Needs the window to be reloaded from the command palette. (Experimental, only works on dark themes for now).'
      type: 'boolean'
      default: false

  activate: (state) ->
    atom.workspace.onDidOpen ->
      Config = require './config'
      Config.apply()
