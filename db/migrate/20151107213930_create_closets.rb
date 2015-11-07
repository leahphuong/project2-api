class CreateClosets < ActiveRecord::Migration
  def change
    create_table :closets do |t|
      t.string :name
      t.string :description

      t.timestamps null: false
    end
  end
end
