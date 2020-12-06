class Poll
  attr_reader :title, :candidates, :deadline, :votes

  def initialize(title, candidates, deadline)
    @title = title
    @candidates = candidates
    @deadline = deadline
    @votes = []
  end

  def add_vote(vote)
    @votes.push(vote)
  end
end