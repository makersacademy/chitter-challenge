require 'Peep'

describe Peep do
    describe '#all' do
      it 'returns all peeps' do
        connection = PG.connect(dbname: 'chitter_test')

        peepone = Peep.create(peep_text: 'My first test peep', time: 'NOW')
        Peep.create(peep_text: 'My second peep', time: 'NOW()')

        peeps = Peep.all

        expect(peeps.length).to eq 2
        expect(peeps.first).to be_a Peep
        expect(peeps.first.id).to eq peepone.id
        expect(peeps.first.peep_text).to eq 'My first peep'
        expect(peeps.first.time).to eq(timenow[0...16])
      end
    end

    describe '#create' do
      it 'creates a new peep' do
        peep = Peep.create(peep_text: 'My second test peep', time: 'NOW()')
        data = PG.connect(dbname: 'chitter_test').query("SELECT * FROM all_peeps WHERE id = #{peep.id};")
        timenow = Time.now.to_s
        expect(peep).to be_a Peep
        expect(peep.id).to eq data.first['id']
        expect(peep.peep_text).to eq 'My second test peep'
        expect(peep.time[0...16]).to eq(timenow[0...16])
      end
    end
end
