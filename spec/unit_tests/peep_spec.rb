require_relative '../helper.rb'

describe Peep do
  it 'returns all of the peeps' do
    truncate_and_add_3_peeps
    expect(Peep.first.body).to eq 'Hello world!'
    expect(Peep.last.body).to eq 'Mario!' 
  end
end
