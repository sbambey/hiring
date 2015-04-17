# == Schema Information
#
# Table name: fields
#
#  id          :integer          not null, primary key
#  name        :string
#  label       :text
#  field_class :string
#  placeholder :text
#  exists      :boolean
#  category_id :integer
#  new_line    :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryGirl.define do
  factory :field do
    name "MyString"
label "MyText"
field_class "MyString"
placeholder "MyText"
  end

end
