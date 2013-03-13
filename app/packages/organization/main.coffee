define (require, exports, module) ->

	UsersView = require './users_view'
	UsersCollection = require './users_collection'
	BaseController = require 'shared/base_controller'
	MenuSectionView = require './menu_section_view'

	exports.Controller = class Controller extends BaseController

		routes:
			'organization': 'showUsersList'
			'organization/users(/p/:page)': 'showUsersList'
			'organization/users/add': 'addUser'
			'organization/users/:id': 'showUserDetails'

		menuSectionData:
			title: 'Organization'
			items: [
				{
					route: 'organization/users'
					action: 'showUsersList'
					text: 'Users'
				}
				{
					route: 'test'
					action: 'testAction'
					text: 'Test Item'
				}
			]

		constructor: ->
			super
			@initMenuSection()

		initMenuSection: ->
			new MenuSectionView(@menuSectionData).render()

		showUsersList: (page)->
			page = parseInt(page) or 1
			console.log 'show list'
			users = new UsersCollection
			users.goTo page,
				success: @_renderUsers
			return users

		_renderUsers: (users) ->
			@currentView = new UsersView
				collection: users
				alignment: 'centered'
				baseRoute: 'organization/users'

			$('#demo-box').html @currentView.render().$el
			return @currentView

		addUser: ->
			console.log 'add user'

		showUserDetails: (userId) ->
			console.log 'show details'
			console.log userId

	return
