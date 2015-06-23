class RemoveImageUrlFromPets < ActiveRecord::Migration
  def change
    remove_column :pets, :image_url, :string
  end
end
