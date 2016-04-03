class Systembolag < ActiveRecord::Base
	has_many :positions
	has_and_belongs_to_many :tags
	belongs_to :creator

	validates :name, presence: true, length: {within: 1..50}
	validates :description, presence: true, length: {within: 1..500}
	validates :creator_id, presence: true
end



