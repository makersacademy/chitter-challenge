require 'peep'
require 'pg'

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

  describe '.all' do
    it 'returns all peeps' do
      peep = Peep.create(peep: 'Coding is fun!')
      Peep.create(peep: 'Ruby is a gem if you know it!')
      Peep.create(peep: "That''s one small step for man, one giant leap for mankind.")

      peeps = Peep.all

      expect(peeps.length).to eq 3
      expect(peeps.first).to be_a Peep
      expect(peeps.first.id).to eq peep.id
      expect(peeps.first.peep).to eq 'Coding is fun!'
      expect(peeps.first.time).to match /(\d{4})-(\d{2})-(\d{2}) (\d{2}):(\d{2}):(\d{2})/
    end
  end
end
