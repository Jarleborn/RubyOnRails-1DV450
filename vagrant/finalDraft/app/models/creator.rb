class Creator < ActiveRecord::Base
	has_many :systembolag
	has_secure_password

	validates :name, presence: true, length: {within: 2..100},
	uniqueness: true
	
end
