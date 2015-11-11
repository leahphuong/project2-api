class AddPhotoUrlToCollections < ActiveRecord::Migration
  def change
    add_column :collections, :photo_url, :string
  end
end
