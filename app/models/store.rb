class Store < ActiveRecord::Base
  attr_accessible :latitude, :longitude, :name, :user_id
  has_many :floors



  validates :latitude, :presence => true
  validates :longitude, :presence => true
  validates :name, :presence => true
end
