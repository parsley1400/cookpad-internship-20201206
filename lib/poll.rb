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

    @votes.each do |v|
      if v.voter == vote.voter
        raise ExistingVoterError
      end
    end

    @votes.push(vote)
  end

  def count_votes
    result = {}

    candidates.each do |candidate|
      result[candidate] = 0
    end

    votes.each do |vote|
      result[vote.candidate] += 1
    end

    result.sort_by{|_key, value| value }.reverse.to_h

    # alice = 0
    # bob = 0
    # @votes.each do |vote|
    #   if vote.candidate == 'Alice'
    #     alice += 1
    #   end
    #   if vote.candidate == 'Bob'
    #     bob += 1
    #   end
    # end

    # {
    #   'Alice' => alice,
    #   'Bob' => bob
    # }

  end
end