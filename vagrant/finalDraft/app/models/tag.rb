class Tag < ActiveRecord::Base
	has_and_belongs_to_many :systembolag
  	validates :name, presence: true, length: {within: 2..20}
  	validates :creator_id, presence: true
end
