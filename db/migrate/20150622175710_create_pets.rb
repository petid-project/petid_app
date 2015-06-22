class CreatePets < ActiveRecord::Migration
  def change
    create_table :pets do |t|
      t.string :name
      t.string :type
      t.string :breed
      t.string :color
      t.string :weight
      t.string :birth_year
      t.references :user, index: true, foreign_key: true
      t.string :chip_id
      t.text :description
      t.string :image_url

      t.timestamps null: false
    end
  end
end
