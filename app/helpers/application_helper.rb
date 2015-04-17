module ApplicationHelper
	def convert_if_devise_key(key)
		if key == "notice"
			"success"
		elsif key == "alert"
			"danger"
		else
			key
		end
	end

	def no_flash?(action)
		no_flash = ["static_pages#landing", "forms#new", "forms#show", "dashboard#main", "dashboard#team", "postings#new"]
		no_flash.include?(action)
	end
	
	def flash_messages
		return "" if flash.empty?
		flash.each do |key, value|
			key = convert_if_devise_key(key)
	    return "<div class='alert alert-#{key}' role='alert'>#{value}</div>".html_safe
	  end
	end

	def active_link(controller, action = nil)
		if action
			if(params[:controller] == controller && params[:action] == action)
				return " class='active'".html_safe
			end
		else
			if(params[:controller] == controller)
				return " class='active'".html_safe
			end
		end
	end

	def markdown(text)
    renderer = Redcarpet::Render::HTML.new(hard_wrap: true, filter_html: true)
    options = {
      autolink: true,
      no_intra_emphasis: true,
      fenced_code_blocks: true,
      lax_html_blocks: true,
      strikethrough: true,
      superscript: true
    }
    Redcarpet::Markdown.new(renderer, options).render(text).html_safe
  end
end
