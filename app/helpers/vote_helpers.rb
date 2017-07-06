module VoteHelper

  def vote_value
    total = 0
    self.votes.each do |vote|
      total += vote.value
    end
    total
  end

  def find_vote(user_id)
    self.votes.find_by(voter_id: user_id)
  end

  def voted?(user_id)
    return true if self.votes.find_by(voter_id: user_id)
    false
  end

  def upvote?(user_id)
    return true if self.votes.find_by(voter_id: user_id).value == 1
    false
  end

  def downvote?(user_id)
    return true if self.votes.find_by(voter_id: user_id).value == -1
    false
  end
end

helpers VoteHelper
