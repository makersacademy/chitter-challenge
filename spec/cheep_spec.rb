require 'cheep'
require 'database_helpers'

describe Cheep do
  describe '.all' do
    it 'returns all cheeps' do
      connection = PG.connect(dbname: 'cheeps_test_database')

      cheep = Cheep.create(author: "Jason", message: "First cheep")
      Cheep.create(author: "Lisa", message: "Second cheep")
      Cheep.create(author: "Zoe", message: "Third cheep")
      
      cheeps = Cheep.all

      expect(cheeps.length).to eq 3
      expect(cheeps.first).to be_a Cheep
      expect(cheeps.first.id).to eq cheeps[0].id
      expect(cheeps.first.author).to eq 'Jason'
      expect(cheeps.first.message).to eq 'First cheep'
    end
  end


describe '.create' do
  it 'creates a new cheep' do
    cheep = Cheep.create(author: 'test', message: 'This is the .create test')
    persisted_data = persisted_data(id: cheep.id)

    expect(cheep).to be_a Cheep
    expect(cheep.id).to eq persisted_data['id']
    expect(cheep.author).to eq('test')
    expect(cheep.message).to eq('This is the .create test')

  end
end
end