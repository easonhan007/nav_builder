module ApplicationHelper
	include Pagy::Frontend

	def back_link(kls)
		link_to 'back', 'javascript:history.back()', class: kls
	end
end
