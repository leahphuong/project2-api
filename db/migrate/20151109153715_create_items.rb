class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.string :photo_url
      t.string :description
      t.references :collection, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
