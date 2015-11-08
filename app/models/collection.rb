class Collection < ActiveRecord::Base
  belongs_to :closet
  has_many :items
end
