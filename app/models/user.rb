
class User < ActiveRecord::Base
  #everything that involves dealing with user's authentication
  include Authentication
  has_many :collections
  has_one :profile
end
