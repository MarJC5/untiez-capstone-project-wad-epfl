class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :firstname
      t.string :lastname
      t.string :pseudo
      t.boolean :confirmed
      t.string :email
      t.string :avatar
      t.string :role
      t.text :bio
      t.string :location
      t.string :password_digest

      t.timestamps
    end
  end
end
