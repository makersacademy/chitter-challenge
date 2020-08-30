require 'chitter'


describe Cheep do
  describe '.all' do
    it 'returns all cheeps' do
    connection = PG.connect(dbname: 'chitter_test')

    Cheep.create(cheep: 'Hello Chitter!')
    Cheep.create(cheep: 'What shall I eat for dinner?')
    Cheep.create(cheep: ':)')


    cheeps = Cheep.all 

    expect(cheeps).to include('Hello Chitter!')
    expect(cheeps).to include('What shall I eat for dinner?')
    expect(cheeps).to include(':)')

    end
  end

  describe '.create' do
    it 'creates a new cheep' do
      Cheep.create(cheep: 'Good morning!')

      expect(Cheep.all).to include('Good morning!')
    end
  end
end