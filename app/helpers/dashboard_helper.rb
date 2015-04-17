module DashboardHelper
	def team_actions(user_receiving_actions, user_doing_actions)
		return if !(user_doing_actions.lead? || user_doing_actions.owner?)
		actions = "".html_safe
		
		if user_doing_actions.owner? && !user_receiving_actions.owner?
			actions += link_to "Remove user", user_path(user_receiving_actions), method: :delete, data: { confirm: "Are you sure? This will permanently delete this user's account." }
			if !user_receiving_actions.lead?
				actions += link_to "Make lead", user_path(user_receiving_actions, user: {type: "Lead"}), method: :put
			else
				actions += link_to "Remove lead", user_path(user_receiving_actions, user: {type: "Member"}), method: :put
			end
			actions += link_to "Make owner", user_path(user_receiving_actions, user: {type: "Owner"}), method: :put
		
		elsif user_doing_actions.lead? && !user_receiving_actions.lead?
			actions += "#{link_to "Remove user", user_path(user_receiving_actions), method: :delete, data: { confirm: "Are you sure? This will permanently delete this user's account." }} ".html_safe
			actions += link_to "Make lead", user_path(user_receiving_actions, user: {type: "Lead"}), method: :put
		end
	end
end
