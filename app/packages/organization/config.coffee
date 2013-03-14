define (require, exports, module) ->

	exports.menuSectionData =
		title: 'Organization'
		items: [
			{
				route: '/organization/info'
				action: 'showInfo'
				text: 'Info'
			}
			{
				route: 'organization/users'
				action: 'showUsersList'
				text: 'Users'
			}
		]
	return
