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

require 'rails_helper'

RSpec.describe Field, type: :model do
  let(:field) { build(:field) }

  subject { field }

  it { is_expected.to belong_to(:category) }
end
