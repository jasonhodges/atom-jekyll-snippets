# {TextEditorView} = require 'atom-space-pen-views'
{$} = require 'atom-space-pen-views'
{$, View} = require 'space-pen'

module.exports =
class JekyllSnippetsView extends View
  @content: ->
    @div class: 'jekyll-snippets overlay from-top', =>
      @div "The JekyllSnippets package is Alive! It's ALIVE!", class: "message"

  initialize: ->
    atom.commands.add @element,
    'jekyll-snippets:toggle', => @toggle()

  # Returns an object that can be retrieved when package is activated
  serialize: ->

  # Tear down any state and detach
  destroy: ->
    @element.remove()

  getElement: ->
    @element
