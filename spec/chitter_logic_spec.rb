require './model/chitter_logic'

describe Logic do

  describe '.create' do
    it 'Sends new peeps to database' do
      peep = Logic.create(peep: "Hi I'm on Chitter!")
      db = PG.connect(dbname: 'chitter_test')
      expect(peep["peep"]).to eq("Hi I'm on Chitter")
    end
  end
end
