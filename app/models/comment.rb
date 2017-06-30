class Comment < ActiveRecord::Base
  validates :body, length: {minimum: 1}

  belongs_to :commenter, class_name: User
  belongs_to :commentable, polymorphic: true
  has_many :votes, as: :votable
end
