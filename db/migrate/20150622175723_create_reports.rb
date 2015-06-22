class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.datetime :date_of_loss
      t.string :location
      t.references :user, index: true, foreign_key: true
      t.references :pet, index: true, foreign_key: true
      t.text :description
      t.text :notes

      t.timestamps null: false
    end
  end
end
