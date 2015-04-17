# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  username               :string           not null
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  company_id             :integer
#  type                   :string           not null
#  created_at             :datetime
#  updated_at             :datetime
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

FactoryGirl.define do
  factory :user do
    username "testusername"
    sequence(:email) {|n| "test#{n}@test.com"}
    password "pw123123"
    password_confirmation "pw123123"
    type "Member"

    factory :lead do
    	type "Lead"
    end

    factory :owner do
      type "Owner"
    end
  end
end
