JekyllSnippets = require '../lib/jekyll-snippets'

# Use the command `window:run-package-specs` (cmd-alt-ctrl-p) to run specs.
#
# To run a specific `it` or `describe` block add an `f` to the front (e.g. `fit`
# or `fdescribe`). Remove the `f` to unfocus the block.

describe "JekyllSnippets", ->
  activationPromise = null

  beforeEach ->
    atom.workspaceView = new WorkspaceView
    activationPromise = atom.packages.activatePackage('jekyllSnippets')

  describe "when the jekyll-snippets:toggle event is triggered", ->
    it "attaches and then detaches the view", ->
      expect(atom.workspaceView.find('.jekyll-snippets')).not.toExist()

      # This is an activation event, triggering it will cause the package to be
      # activated.
      atom.workspaceView.trigger 'jekyll-snippets:toggle'

      waitsForPromise ->
        activationPromise

      runs ->
        expect(atom.workspaceView.find('.jekyll-snippets')).toExist()
        atom.workspaceView.trigger 'jekyll-snippets:toggle'
        expect(atom.workspaceView.find('.jekyll-snippets')).not.toExist()
