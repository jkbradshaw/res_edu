class Faculty < ActiveRecord::Base
  has_many :votes
  
  def total_score
    votes.inject(0) {|total, n| total + n.points}
  end
  
  def average
    if votes.count > 0
      total_score / votes.count
    else
      0
    end
  end
  
end
