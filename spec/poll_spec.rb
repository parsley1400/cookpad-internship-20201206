require_relative '../lib/poll'
require_relative '../lib/vote'

RSpec.describe Poll do
  it 'has a title and candidates and a deadline' do
    poll = Poll.new('Awesome Poll', ['Alice', 'Bob'], '20201231')

    expect(poll.title).to eq 'Awesome Poll'
    expect(poll.candidates).to eq ['Alice', 'Bob']
    expect(poll.deadline).to eq '20201231'
  end

  describe '#add_vote' do
    it 'saves the given vote' do
      poll = Poll.new('Awesome Poll', ['Alice', 'Bob'], '20201231')
      vote = Vote.new('Miyoshi', 'Alice')

      poll.add_vote(vote)

      expect(poll.votes).to eq [vote]
    end

    context 'with a vote that has an invalid candidate' do
      it 'raises InvalidCandidateError' do
        poll = Poll.new('Awesome Poll', ['Alice', 'Bob'], '20201231')
        vote = Vote.new('Miyohsi', 'INVALID')

        expect { poll.add_vote(vote) }.to raise_error Poll::InvalidCandidateError
      end
    end

    context 'with a vote that has an existing voter' do
      it 'raises ExistingVoterError' do
        poll = Poll.new('Awesome Poll', ['Alice', 'Bob'], '20201231')
        vote1 = Vote.new('INVALID', 'Alice')
        vote2 = Vote.new('INVALID', 'Alice')

        poll.add_vote(vote1)

        expect { poll.add_vote(vote2) }.to raise_error Poll::ExistingVoterError
      end
    end
  end

  describe '#count_votes' do
    it 'counts the votes and sorts the candidates by the number of votes' do
      poll = Poll.new('Awesome Poll', ['Alice', 'Bob'], '20201231')
      poll.add_vote(Vote.new('Carol', 'Alice'))
      poll.add_vote(Vote.new('Dave', 'Alice'))
      poll.add_vote(Vote.new('Ellen', 'Bob'))

      result = poll.count_votes

      expect(result['Alice']).to eq 2
      expect(result['Bob']).to eq 1
      expect(result.keys).to eq ['Alice','Bob']

      poll2 = Poll.new('Great Poll', ['Alice', 'Bob'],'20201231')
      poll2.add_vote(Vote.new('Carol', 'Bob'))
      poll2.add_vote(Vote.new('Dave', 'Bob'))

      result2 = poll2.count_votes

      expect(result2['Alice']).to eq 0
      expect(result2['Bob']).to eq 2
      expect(result2.keys).to eq ['Bob', 'Alice']

    end
  end
end