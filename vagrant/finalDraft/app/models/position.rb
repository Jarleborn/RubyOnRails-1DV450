class Position < ActiveRecord::Base
	belongs_to :systembolags

 
  validates :systembolag_id, presence: true
  # validates :longitude, presence: true
  # validates :latitude, presence: true
  validates :adress, presence: true, length: {within: 10..200}

  geocoded_by :adress
  after_validation :geocode,
                   :if => lambda{ |obj| obj.adress_changed? }
end
