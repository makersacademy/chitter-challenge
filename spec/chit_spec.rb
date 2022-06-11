require 'chit'
require 'database_helpers'

describe Chit do
  describe '.all' do
    it 'should show all posted chits' do
      connection = PG.connect(dbname: 'chitter_test')

      chit = Chit.create(text: 'My first chit')
      Chit.create(text: "Look ma, I''m chitting!")
      Chit.create(text: "Listen here, you little chit")
  
      chits = Chit.all
      expect(chits.length).to eq 3
      expect(chits.first).to be_a Chit
      expect(chits.first.id).to eq chit.id
      expect(chits.first.text).to eq "My first chit"
    end
  end

  describe '.create' do
    it 'should create a new chit' do
      chit = Chit.create(text: "I am writing something")
      persisted_data = persisted_data(id: chit.id)

      expect(chit).to be_a Chit
      expect(chit.id).to eq persisted_data['id']
      expect(chit.text).to eq "I am writing something"
    end
  end
end