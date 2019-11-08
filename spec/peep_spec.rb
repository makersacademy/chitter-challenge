require './lib/peep.rb'

describe Peep do

  describe '.all' do
    it 'returns a list of peeps' do
      connection = PG.connect(dbname: 'chitter_test')

      peep = Peep.make_peep(maker: 'Kris', message: 'Checking the class!', time: '5:00pm')
      Peep.make_peep(maker: 'Dave', message: 'Checking it again!', time: '5:05pm')
      Peep.make_peep(maker: 'Eoin', message: 'Checking one last time!', time: '5:10pm')

      peeps = Peep.all

      expect(peeps.length).to eq 3
      expect(peeps.first).to be_a Peep
      expect(peeps.first.id).to eq peep.id
      expect(peeps.first.maker).to eq 'Kris'
      expect(peeps.first.message).to eq 'Checking the class!'
    end
  end


  describe '.make_peep' do
    it 'creates a new peep' do
      peep = Peep.make_peep(maker: 'Marc', message: 'Checking peep created!', time: '5:50pm')
      connection = PG.connect(dbname: 'chitter_test')
      result = connection.query("SELECT * FROM peeps WHERE id = #{id};")
      result.first
  
      expect(peep).to be_a Peep
      expect(peep.maker).to eq 'Marc'
      expect(peep.message).to eq 'Checking peep created!'
    end
  end
end