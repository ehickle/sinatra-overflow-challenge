class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, null:false
      t.string :username, null:false
      t.string :password_hash, null:false
      t.integer :score

      t.timestamps
    end
  end
end
