class Answer < ActiveRecord::Base
  validates :body, length: {minimum: 1}

  belongs_to :author, class_name: User
  belongs_to :question
  has_many :comments, as: :commentable
  has_many :votes, as: :votable

  def time_since_creation
    ((Time.now - created_at) / 3600).round
  end

  def vote_value
    total = 0
    self.votes.each do |vote|
      total += vote.value
    end
    total
  end
end
