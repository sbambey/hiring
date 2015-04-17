# == Schema Information
#
# Table name: companies
#
#  id         :integer          not null, primary key
#  name       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Company, type: :model do
  let(:company) { build(:company) }

  subject { company }

  it "has associations" do
  	is_expected.to have_many(:users)
  	is_expected.to have_many(:owners)
  	is_expected.to have_many(:leads)
  	is_expected.to have_many(:members)
  	is_expected.to have_many(:postings)
  end
end
