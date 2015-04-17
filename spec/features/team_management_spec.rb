require "rails_helper"

feature "Managing team members" do

	given!(:company) { create(:company) }
	given!(:member) { create(:user, company: company) }
	given(:owner) { build(:owner, company: company) }
	given(:lead) { build(:lead, company: company) }
	
	feature "managing roles" do
		scenario "as owner" do
			owner.save

			manual_sign_in(owner)
			visit dashboard_team_path

			expect(page).to have_content(owner.email)
			expect(page).to have_content(member.email)

			expect(page).to have_content("Remove user", count: 1)
			expect(page).to have_content("Make lead", count: 1)
			expect(page).to have_content("Make owner", count: 1)

			click_link "Make lead"

			expect(page).to_not have_content("Make lead")
			expect(page).to have_content("Remove lead")

			click_link "Remove lead"

			expect(page).to_not have_content("Remove lead")
			expect(page).to have_content("Make lead")

			click_link "Make owner"

			expect(page).to_not have_content("Remove user")
			expect(page).to_not have_content("Make lead")
			expect(page).to_not have_content("Make owner")
		end

		scenario "as lead" do
			lead.save

			manual_sign_in(lead)
			visit dashboard_team_path

			expect(page).to have_content("Remove user", count: 1)
			expect(page).to have_content("Make lead", count: 1)
			expect(page).to_not have_content("Make owner")
		end

		scenario "as member" do
			create(:user, company: company)

			manual_sign_in(member)
			visit dashboard_team_path

			expect(page).to_not have_content("Remove user")
			expect(page).to_not have_content("Make lead")
			expect(page).to_not have_content("Make owner")
		end
	end

	scenario "deleting a user" do
		owner.save

		manual_sign_in(owner)
		visit dashboard_team_path

		click_link "Remove user"

		expect(page).to_not have_content "Remove user"
	end
end