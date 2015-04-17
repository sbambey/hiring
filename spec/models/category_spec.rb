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

require 'rails_helper'

RSpec.describe Category, type: :model do
	let(:category) { build(:category) }

	subject { category }

	it do
		is_expected.to belong_to(:form)
		is_expected.to have_many(:fields)
	end

	context "destroying object" do
		it "destroys dependent records" do
			category.save
			field = create(:field, category: category)
			expect{category.destroy}.to change(Field, :count).by(-1)
		end
	end

	it { is_expected.to accept_nested_attributes_for(:fields) }
end