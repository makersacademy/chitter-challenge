require_relative '../helper.rb'

describe Peep do
  it 'returns all of the peeps' do
    expect(Peep.first.body).to eq 'Hello world!'
    expect(Peep.last.body).to eq 'Mario!'
  end
end
