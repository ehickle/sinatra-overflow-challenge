class Comment < ActiveRecord::Base
  validates :body, length: {minimum: 1}

  belongs_to :commenter, class_name: User
  belongs_to :commentable, polymorphic: true
  has_many :votes, as: :votable

  def time_since_creation
    ((Time.now - created_at) / 3600).round
  end
end
