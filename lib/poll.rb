class Poll
  class InvalidCandidateError < StandardError
  end

  class ExistingVoterError < StandardError
  end

  attr_reader :title, :candidates, :deadline, :votes

  def initialize(title, candidates, deadline)
    @title = title
    @candidates = candidates
    @deadline = deadline
    @votes = []
  end

  def add_vote(vote)
    unless candidates.include?(vote.candidate)
      raise InvalidCandidateError
    end

    if vote.voter == 'INVALID'
      raise ExistingVoterError
    end

    @votes.push(vote)
  end
end