require 'honk'
require 'database_helpers'

describe Honk do

  before(:each) do
    connection = PG.connect(dbname: 'honker_test')

    connection.exec("TRUNCATE honks;")
  end
  
  describe '.all' do
    it 'returns all honks' do
      honk = Honk.add(text: "Honkin around and loving it")
      Honk.add(text: 'Good afternoon, Mr, Honkswell. Please do take a seat.')
      Honk.add(text: 'HONKETY HONK HONK')

      honks = Honk.all

      expect(honks.length).to eq(3)
      expect(honks[0]).to be_a(Honk)
      expect(honks[0].id).to eq honk.id
      expect(honks[0].text).to eq('Honkin around and loving it')
      expect(honks[1].text).to eq('Good afternoon, Mr, Honkswell. Please do take a seat.')
    end
  end

  describe '.add' do
    it 'adds a honk to the database' do
      honk = Honk.add(text: 'Honkety honk honk')
      persisted_data = persisted_data(id: honk.id)

      expect(honk).to be_a Honk
      expect(honk.id).to eq persisted_data.first['id']
      expect(honk.text).to eq('Honkety honk honk')
    end
  end
end
