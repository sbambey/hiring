require "rails_helper"

feature "Creating a posting" do

	given(:posting) { build(:posting) }

	scenario "proper posting flow" do
		visit new_posting_path

		fill_in "#wmd-input-description", with: posting.description
		fill_in "Title", with: posting.title

		click_button "Create posting"

		expect(page).to have_content "Created posting successfully."
	end
end