JekyllSnippetsView = require './jekyll-snippets-view'

module.exports =
  jekyllSnippetsView: null 

  activate: (state) ->
    @jekyllSnippetsView = new JekyllSnippetsView(state.jekyllSnippetsViewState)

  deactivate: ->
    @jekyllSnippetsView.destroy()

  serialize: ->
    jekyllSnippetsViewState: @jekyllSnippetsView.serialize()
