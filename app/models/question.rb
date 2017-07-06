class Question < ActiveRecord::Base
  belongs_to :author, class_name: User
  has_many :comments, as: :commentable
  has_many :votes, as: :votable
  has_many :answers

  include VoteHelper

  def time_since_creation
    ((Time.now - created_at) / 3600).round
  end

  def best_answer_author_id
    answer = Answer.find(self.best_answer_id)
    answer.author.id
  end
end
