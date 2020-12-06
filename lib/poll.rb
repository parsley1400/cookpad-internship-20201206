class Poll
  attr_reader :title, :candidates, :deadline

  def initialize(title, candidates, deadline)
    @title = title
    @candidates = candidates
    @deadline = deadline
  end
end