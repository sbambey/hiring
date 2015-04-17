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

class Category < ActiveRecord::Base
	belongs_to :form
	has_many :fields, dependent: :destroy
	accepts_nested_attributes_for :fields, allow_destroy: true
end
