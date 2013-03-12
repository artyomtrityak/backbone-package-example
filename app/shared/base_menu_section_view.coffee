define (require, exports, module) ->
	
	mediator = require 'shared/mediator'
	BaseView = require 'shared/base_view'

	class BaseMenuSectionView extends BaseView

		render: ->
			mediator.trigger 'menu:append-section', @
			@
