describe Peep do
  describe '.create' do
    it 'creates a new peep' do
      msg = 'Coding is fun!'
      peep = Peep.create(peep: msg)
      connection = PG.connect(dbname: 'chitter_test')
      data = connection.query("SELECT * FROM peeps WHERE id = #{peep.id};")
      expect(peep.id).to eq(data.first['id'])
      expect(peep.peep).to eq(msg)
      expect(peep.time).to match(/(\d{4})-(\d{2})-(\d{2}) (\d{2}):(\d{2}):(\d{2})/)
    end
  end
end
