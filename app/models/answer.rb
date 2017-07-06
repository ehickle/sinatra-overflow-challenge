class Answer < ActiveRecord::Base
  validates :body, length: {minimum: 1}

  belongs_to :author, class_name: User
  belongs_to :question
  has_many :comments, as: :commentable
  has_many :votes, as: :votable

  include VoteHelper

  def time_since_creation
    ((Time.now - created_at) / 3600).round
  end
end
