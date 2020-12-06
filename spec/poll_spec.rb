require_relative '../lib/poll'

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
  end
end