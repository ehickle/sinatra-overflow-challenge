class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :voter_id, null:false
      t.integer :value, null:false
      # t.integer :votable_id, null:false
      # t.string :votable_type, null:false
      t.references :votable, polymorphic: true, index: true
      t.timestamps
    end
    # add_index :votes, [:votable_type, :votable_id]
  end
end
