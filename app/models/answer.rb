class Answer < ActiveRecord::Base
  validates :body, length: {minimum: 1}

  belongs_to :author, class_name: User
  belongs_to :question
  has_many :comments, as: :commentable
  has_many :votes, as: :votable
end
