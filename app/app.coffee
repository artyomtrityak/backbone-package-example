define (require, exports, module) ->
	
	# Load appState
	appState = require 'shared/app_state'

	# Load menu container
	MenuContainerView = require 'shared/base_menu_container_view'

	# Packages loading
	demoPackage = require 'packages/demo'
	orgPackage = require 'packages/organization'
	
	#Utils and other
	Utils = require 'shared/utils'

	if module.config().fakeServer
		server = require 'server'
		server.start()

	exports.App = Backbone.Router.extend {
		routes:
			'*other': 'unknownRoute'

		initialize: ->
			if @authenticate()
				@initMenu()
			Utils.bindRoutes @, [
				demoPackage.Controller
				orgPackage.Controller
			]

		unknownRoute: ->
			console.log 'unknown'

		authenticate: ->
			yes

		initMenu: ->
			@menuContainerView = new MenuContainerView
				el: '#menu'
			appState.set 'menuContainerView', @menuContainerView
	}
	return
