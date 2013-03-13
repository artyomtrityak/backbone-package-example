expect = chai.expect

describe 'BaseMenuSectionViewTest', ->
	
	BaseMenuSectionView = null
	menuSectionData = null

	initmenuSectionData = ->
		menuSectionData =
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

	beforeEach (done) ->
		require [
			'shared/base_menu_section_view'
		], (_BaseMenuSectionView) ->
			initmenuSectionData()
			BaseMenuSectionView = _BaseMenuSectionView
			done()

	it 'expect that view can be rendered in the DOM', (done) ->
		view = new BaseMenuSectionView menuSectionData
		expect(view).to.be.an 'object'

		expect(view).to.have.a.property 'title'
		expect(view.title).to.be.equal menuSectionData.title
		
		expect(view).to.have.a.property 'items'
		expect(view.items).to.be.deep.equal menuSectionData.items


		for meth in ['render', 'dispose']
			expect(view).to.have.property meth
			expect(view[meth]).to.be.a 'function'

		expect(view).to.have.a.property 'render'
		expect(view.render()).to.be.equal view
		
		html = view.$el.html()
		
		for menuItem in menuSectionData.items
			expect(html).to.contain menuItem.text
			expect(html).to.contain menuItem.action
			expect(html).to.contain "href=\"##{menuItem.route}\""

		expect(view).to.have.a.property 'dispose'
		expect(view.dispose).to.be.a 'function'
		expect(view.dispose()).to.be.equal view

		done()

	it 'expect that view determines actions correctly', (done) ->
		view = new BaseMenuSectionView menuSectionData

		expect(view).to.have.a.property 'isRelatedAction'
		expect(view.isRelatedAction).to.be.a 'function'

		correctAction = menuSectionData.items[0].action
		incorrectAction = correctAction + Date.now()

		expect(view.isRelatedAction correctAction).to.be.true
		expect(view.isRelatedAction incorrectAction).to.be.false

		done()
