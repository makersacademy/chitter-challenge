describe Peep do

  describe '#all' do
    it 'returns all Peeps in the database' do
      conn = PG.connect(dbname: 'chitter_test')
      conn.exec("INSERT INTO peeps (message, maker_id, timestamp) VALUES('new message', '1', '#{Time.now}') RETURNING id, message, maker_id, timestamp")
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

  describe '#create' do
    it 'adds a timestamp to the Peep' do
      Peep.create('new message 3', '1')
      peeps = Peep.all
      expect(peeps.first.time).to be_kind_of(Time)
    end
  end

end
