class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :author_id, null:false
      t.integer :question_id, null:false
      t.string :body, null:false
      t.bit :best, null:false

      t.timestamps
    end
  end
end
