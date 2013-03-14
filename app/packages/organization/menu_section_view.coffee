define (require, exports, module) ->

	BaseMenuSectionView = require 'shared/base_menu_section_view'
	template = require 'text!./templates/menu_section.html'

	class MenuSectionView extends BaseMenuSectionView
		template: _.template template
