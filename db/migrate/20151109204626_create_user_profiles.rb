class CreateUserProfiles < ActiveRecord::Migration
  def change
    create_table :user_profiles do |t|
      t.string :surname
      t.string :given_name

      t.timestamps null: false
    end
  end
end
