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

class Posting < ActiveRecord::Base
	belongs_to :company
	belongs_to :user
	has_many :forms
end
