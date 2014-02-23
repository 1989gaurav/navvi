class Floor < ActiveRecord::Base
  belongs_to :store
  has_many :sections
  attr_accessible :nick
end
