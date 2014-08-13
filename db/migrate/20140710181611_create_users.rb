class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.datetime :birthday
      t.string :avatar
      t.integer :status
      t.string :uid
      t.string :location
      t.text :bio

      t.timestamps
    end
  end
end
