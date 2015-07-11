JekyllSnippets = require '../lib/jekyll-snippets'
# {$} = require 'atom-space-pen-views'

# Use the command `window:run-package-specs` (cmd-alt-ctrl-p) to run specs.
#
# To run a specific `it` or `describe` block add an `f` to the front (e.g. `fit`
# or `fdescribe`). Remove the `f` to unfocus the block.

describe "JekyllSnippets", ->
  [workspaceElement, activationPromise] = []

  beforeEach ->
    workspaceElement = atom.views.getView(atom.workspace)
    activationPromise = atom.packages.activatePackage('jekyll-snippets')
    activationPromise.fail (reason) ->
      throw reason

    jasmine.attachToDOM(workspaceElement)

  describe "when the jekyll-snippets:toggle event is triggered", ->
    it "attaches and then detaches the view", ->
      expect(workspaceElement.querySelector('.jekyll-snippets')).not.toExist()

      atom.commands.dispatch workspaceElement, 'jekyll-snippets:toggle'

      waitsForPromise ->
        activationPromise

      runs ->
        expect(atom.packages.isPackageActive('jekyll-snippets')).toBe true
        atom.commands.dispatch workspaceElement, 'jekyll-snippets:toggle'
        expect(workspaceElement.querySelector('.jekyll-snippets')).not.toExist()
