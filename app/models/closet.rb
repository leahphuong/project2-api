class Closet < ActiveRecord::Base
  belongs_to :person
  has_many :items, through: :collections
end
