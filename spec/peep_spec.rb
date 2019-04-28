require 'peep'
describe Peep do
  it 'creates a peep' do
    peep = Peep.new('some message')
    expect(peep.message).to eq 'some message'
  end
end