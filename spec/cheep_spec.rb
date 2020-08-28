require 'chitter'


describe Cheep do
  describe '.all' do
    it 'returns all cheeps' do
    cheeps = Cheep.all 

    expect(cheeps).to include('Hello Chitter!')
    expect(cheeps).to include('What shall I eat for dinner?')
    expect(cheeps).to include(':)')
    end
  end
end