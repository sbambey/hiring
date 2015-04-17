# == Schema Information
#
# Table name: forms
#
#  id          :integer          not null, primary key
#  first_name  :boolean
#  middle_name :boolean
#  last_name   :boolean
#  home_phone  :boolean
#  cell_phone  :boolean
#  posting_id  :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe Form, type: :model do
  let(:form) { build(:form) }

  subject { form }

  it "has associations" do
  	is_expected.to belong_to(:posting)
  	is_expected.to have_many(:categories)
  end
end
