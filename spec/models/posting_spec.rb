# == Schema Information
#
# Table name: postings
#
#  id          :integer          not null, primary key
#  title       :text
#  description :text
#  company_id  :integer
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe Posting, type: :model do
	let(:posting) { build(:posting) }

	subject { posting }

	it "has associations" do
		is_expected.to belong_to(:company)
		is_expected.to belong_to(:user)
		is_expected.to have_many(:forms)
	end
end
