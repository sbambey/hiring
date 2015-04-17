require "rails_helper"

feature "Signing up a user" do

	given(:company) { build(:company) }
	given(:user) { build(:user) }
	
	scenario "proper signup flow" do
		visit sign_up_path

		fill_in "Company name", with: company.name

		fill_in "Username", with: user.username
		fill_in "Email", with: user.email
		fill_in "Password", with: user.password
		fill_in "Password confirmation", with: user.password_confirmation

		click_button "Sign up"

		expect(current_path).to eq(dashboard_path)
	end

	scenario "when already logged in" do
		user.save
		manual_sign_in(user)

		visit sign_up_path

		expect(page).to_not have_content("Sign up")
	end
end