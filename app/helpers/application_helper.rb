module ApplicationHelper

	# Returns the full title on a oer-page basis
	def full_title(page_title = '')
		base_title = "Demo App"
		if page_title.empty?
			base_title
		else
			page_title + " | " + base_title
		end
	end
end
