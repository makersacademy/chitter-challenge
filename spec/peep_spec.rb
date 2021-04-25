require 'peep'

describe Peep do
  describe '.create' do
    it 'saves the peep in the database' do
      peep = 'This is the first peep'
      Peep.create(peep)

      text = DatabaseConnection.query("SELECT text FROM peeps").first['text']
      expect(text).to eq peep
    end
  end
end
