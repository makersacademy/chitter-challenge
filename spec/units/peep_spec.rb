describe Peep do

  describe '#all' do
    it 'returns all Peeps in the database' do
      conn = PG.connect(dbname: 'chitter_test')
      conn.exec("INSERT INTO peeps (message, maker_id) VALUES('new message', '1') RETURNING id, message, maker_id")
      peeps = Peep.all
      expect(peeps.first.message).to eq 'new message'
    end
  end

  describe '#create' do
    it 'adds a Peep to the database' do
      Peep.create('new message 2', '1')
      peeps = Peep.all
      expect(peeps.first.message).to eq 'new message 2'
    end
  end

end
