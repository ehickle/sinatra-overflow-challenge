class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :author_id, null:false
      t.integer :best_answer_id
      t.string :title, null:false
      t.string :body, null:false

      t.timestamps
    end
  end
end
