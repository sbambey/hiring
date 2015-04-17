# == Schema Information
#
# Table name: companies
#
#  id         :integer          not null, primary key
#  name       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Company < ActiveRecord::Base
	has_many :users
	has_many :leads
	has_many :members
	has_many :owners
	has_many :postings
	accepts_nested_attributes_for :users
end
