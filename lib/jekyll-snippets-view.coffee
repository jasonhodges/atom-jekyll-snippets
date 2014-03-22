{View} = require 'atom'

module.exports =
class JekyllSnippetsView extends View
  @content: ->
    @div class: 'jekyll-snippets overlay from-top', =>
      @div "The JekyllSnippets package is Alive! It's ALIVE!", class: "message"

  initialize: (serializeState) ->
    atom.workspaceView.command "jekyll-snippets:toggle", => @toggle()

  # Returns an object that can be retrieved when package is activated
  serialize: ->

  # Tear down any state and detach
  destroy: ->
    @detach()

  toggle: ->
    console.log "JekyllSnippetsView was toggled!"
    if @hasParent()
      @detach()
    else
      atom.workspaceView.append(this)
