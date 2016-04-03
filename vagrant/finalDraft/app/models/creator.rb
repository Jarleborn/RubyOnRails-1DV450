class Creator < ActiveRecord::Base
	has_many :systembolag
	has_secure_password

	validates :name, presence: true, length: {within: 2..100}
	validates :password, presence: true, length: {within: 6..40}
  	validates :password_confirmation, presence: true
end
