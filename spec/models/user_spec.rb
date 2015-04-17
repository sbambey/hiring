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

require 'rails_helper'

describe User do
  let(:user) { build(:user) }

  subject { user }

  it "has associations" do
  	is_expected.to belong_to(:company)
    is_expected.to have_many(:postings)
  end

  describe "validates" do
    it "username" do
      is_expected.to validate_presence_of(:username)
      is_expected.to validate_length_of(:username).is_at_least(3).is_at_most(15)
    end

    it "type" do
      is_expected.to validate_presence_of(:type)
      is_expected.to validate_inclusion_of(:type).in_array(%w(Lead Member))
    end
  end

  describe "#member?" do
    context "when user is not a member" do
      it do
        user.type = "Lead"
        expect(user.member?).to eq(false)

        user.type = "Owner"
        expect(user.member?).to eq(false)
      end
    end

    context "when user is a member" do
      it do
        user.type = "Member"
        expect(user.member?).to eq(true)
      end
    end
  end

  describe "#lead?" do
    context "when user is not a lead" do
      it do
        user.type = "Member"
        expect(user.lead?).to eq(false)

        user.type = "Owner"
        expect(user.lead?).to eq(false)
      end
    end

  	context "when user is a lead" do
  		it do
        user.type = "Lead"
        expect(user.lead?).to eq(true)
      end
  	end
  end

  describe "#owner?" do
    context "when user is not an owner" do
      it do
        user.type = "Member"
        expect(user.owner?).to eq(false)

        user.type = "Lead"
        expect(user.owner?).to eq(false)
      end
    end

    context "when user is an owner" do
      it do
        user.type = "Owner"
        expect(user.owner?).to eq(true)
      end
    end
  end

  describe "#has_priviliges?" do
    context "when user is a member" do
      it do
        user.type = "Member"
        expect(user.has_priviliges?).to eq(false)
      end
    end

    context "when user is a lead" do
      it do
        user.type = "Lead"
        expect(user.has_priviliges?).to eq(true)
      end
    end

    context "when user is an owner" do
      it do
        user.type = "Owner"
        expect(user.has_priviliges?).to eq(true)
      end
    end
  end
end
