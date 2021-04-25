require 'peep'

describe Peep do
  describe '.create' do
    it 'saves the peep in the database' do
      peep = 'This is the first peep'
      Peep.create(text: peep)

      text = DatabaseConnection.query("SELECT text FROM peeps").first['text']
      expect(text).to eq peep
    end
  end

  describe '.list' do
    it 'retrieves peeps from the database in reverse order' do
      peep1 = 'This is the first peep'
      peep2 = 'This is the second peep'
      Peep.create(text: peep1)
      Peep.create(text: peep2)

      result = Peep.list[0].text
      expect(result).to eq peep2
    end
  end
end
