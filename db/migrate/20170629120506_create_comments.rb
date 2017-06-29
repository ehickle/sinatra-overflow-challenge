class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :commenter_id, null:false
      t.references :commentable, polymorphic: true, index: true
      t.string :body, null:false

      t.timestamps
    end
  end
end
