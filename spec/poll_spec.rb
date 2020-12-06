require_relative '../lib/poll'

RSpec.describe Poll do
  it 'has a title and candidates and a deadline' do
    poll = Poll.new('Awesome Poll', ['Alice', 'Bob'], '20201231')

    expect(poll.title).to eq 'Awesome Poll'
    expect(poll.candidates).to eq ['Alice', 'Bob']
    expect(poll.deadline).to eq '20201231'
  end
end