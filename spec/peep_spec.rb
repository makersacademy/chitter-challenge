describe Peep do

  describe '.all' do
    it 'returns a list of peeps' do
      connection = PG.connect(dbname: 'chitter_test')

      peep = Peep.create(peep: "Test peep 1")
      Peep.create(peep: "Test peep 2")
      Peep.create(peep: "Test peep 3")

      peeps = Peep.all
      expect(peeps.length).to eq 3
      expect(peeps.first).to be_a Peep
      expect(peeps.first.id).to eq peep.id
      expect(peeps.first.peep).to eq peep.peep
    end
  end


  describe '.create' do
    it 'creates a new peep' do
      peep = Peep.create(peep: 'Test peep')
      persisted_data = PG.connect(dbname: 'chitter_test').query("SELECT * FROM peeps WHERE id = #{peep.id};")

      expect(peep).to be_a Peep
      expect(peep.peep).to eq persisted_data.first['peep']
    end
  end
end
