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

FactoryGirl.define do
  factory :posting do
    title "Some title"
		description "Some text"
  end
end