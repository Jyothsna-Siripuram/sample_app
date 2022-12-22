# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  email           :string
#  name            :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_users_on_email  (email) UNIQUE
#
class User < ApplicationRecord
	has_secure_password

	# attr_accessor :name, :email, :password, :password_confirmation
	
	before_save { |user| user.email = email.downcase }


	validates :name, presence: true, length: { maximum: 50 }

	validates :email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
		uniqueness:  { case_sensitive: false }

	validates :password, presence: true, length: { minimum: 6 }

	validates :password_confirmation, presence: true
end
