# == Schema Information
#
# Table name: companies
#
#  id         :integer          not null, primary key
#  name       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :company do
    name "MyText"
  end

end
