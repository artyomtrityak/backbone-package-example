define (require, exports, module) ->

	mediator = require 'shared/mediator'
	BaseView = require 'shared/base_view'

	class BaseMenuContainerView extends BaseView

		sections: []

		initialize: ->
			mediator.on 'menu:append-section', @appendSection, @
			super

		dispose: ->
			for sectionView in @sections
				sectionView.dispose()
			super

		appendSection: (sectionView) ->
			@$el.append sectionView.$el
			@sections.push sectionView
