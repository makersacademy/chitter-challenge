require 'peep'

describe '.new' do
  it 'creates new peep' do
    Peep.new(peep: 'Hello from user1')

    expect(Peep.post).to include 'Hello from user1'
  end
end