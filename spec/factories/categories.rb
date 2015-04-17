# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  title      :text
#  form_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :category do
    title "MyText"
		form_id 1
  end
end
