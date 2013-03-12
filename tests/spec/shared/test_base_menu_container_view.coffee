expect = chai.expect

describe 'BaseMenuContainerViewTest', ->
	
	BaseMenuContainerView = null
	
	beforeEach (done) ->
		require [
			'shared/base_menu_container_view'
		], (_BaseMenuContainerView) ->
			BaseMenuContainerView = _BaseMenuContainerView
			done()

	it 'expect that view can be rendered in the DOM', (done) ->
		view = new BaseMenuContainerView
		expect(view).to.be.an 'object'
		for meth in ['render', 'dispose']
			expect(view).to.have.property meth
			expect(view[meth]).to.be.a 'function'
		expect(view.dispose()).to.be.equal view
		done()
