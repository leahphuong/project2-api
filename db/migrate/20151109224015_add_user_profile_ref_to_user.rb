class AddUserProfileRefToUser < ActiveRecord::Migration
  def change
    add_reference :users, :user_profile, index: true, foreign_key: true
  end
end
