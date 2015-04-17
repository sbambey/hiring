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

FactoryGirl.define do
  factory :form do
    first_name false
		middle_name false
		last_name false
		home_phone false
		cell_phone false
  end
end
