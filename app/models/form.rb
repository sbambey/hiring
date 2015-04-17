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

class Form < ActiveRecord::Base
	belongs_to :posting
	has_many :categories, dependent: :destroy
end
