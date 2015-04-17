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

class User < ActiveRecord::Base
	belongs_to :company
  has_many :postings
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username, presence: true, length: { in: 3..15 }
  validates :type, presence: true, inclusion: { in: %w(Owner Lead Member) }

  def owner?
  	type == "Owner"
  end

  def lead?
  	type == "Lead"
  end

  def member?
  	type == "Member"
  end

  def has_priviliges?
  	owner? || lead?
  end
end
