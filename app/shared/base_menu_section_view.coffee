define (require, exports, module) ->

	mediator = require 'shared/mediator'
	BaseView = require 'shared/base_view'
	template = require 'text!shared/templates/menu_section.html'

	class BaseMenuSectionView extends BaseView

		tagName: 'li'
		className: 'menu-section'
		template: _.template template
		actions: {}

		events:
			'click .title': 'toggleCollapseState'

		initialize: (options) ->
			super
			@initIsExpanded()
			@initEvents()
			@initViewData()
			@

		onRouteChange: (action) ->
			unless @isRelatedAction(action)
				return
			@$('.menu-subsection').removeClass 'active'
			@$(".menu-subsection[data-action='#{action}']").addClass 'active'
			@trigger 'expand'

		toggleCollapseState: (e) ->
			e.preventDefault()
			event = unless @isExpanded then 'expand' else 'collapse'
			@trigger event

		initViewData: ->
			for prop in ['title', 'items']
				@[prop] = @options[prop]
			for item in @items
				@actions[item.action] = 1
			@

		isRelatedAction: (action) ->
			!!@actions[action]

		initEvents: ->
			@on 'expand', @onExpand, @
			@on 'collapse', @onCollapse, @
			mediator.on 'app:route-change', @onRouteChange, @
			@

		initIsExpanded: ->
			@isExpanded = @$('.menu-subsections').hasClass 'collapse'
			@

		onExpand: (e) ->
			@$('.menu-subsections').removeClass 'collapse'
			@isExpanded = yes

		onCollapse: (e) ->
			@$('.menu-subsections').addClass 'collapse'
			@isExpanded = no

		render: ->
			@$el.html @template
				data:
					title: @title
					items: @items

			mediator.trigger 'menu:append-section', @
			@
