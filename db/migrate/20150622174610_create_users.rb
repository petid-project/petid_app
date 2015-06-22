class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :uid
      t.string :provider
      t.string :password_digest
      t.string :name
      t.string :city
      t.string :state
      t.string :phone
      t.string :oauth_token
      t.datetime :oauth_expires_at

      t.timestamps null: false
    end
  end
end
