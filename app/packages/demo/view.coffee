define (require, exports, module)->
	BaseView = require 'shared/base_view'
	tpl = require 'text!./templates/demo.html'

	exports.View = BaseView.extend(
		template: _.template tpl

		events: 
			'click #demo-open': 'showNotification'

		initialize: ->
			Backbone.Validation.bind(this) if @model?
			return

		render: ->
			@$el.html @template(
				data: 
					username: 'Artyom'
			)
			return @

		showNotification: ->
			@$('#demoModal').modal 'show'
			return @
	)
	return