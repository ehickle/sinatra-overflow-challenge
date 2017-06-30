module SessionHelper

  def vote_value
    total = 0
    self.votes each do |vote|
      total += vote.value
    end
    total
  end
end

helpers SessionHelper
