require 'peeps'
require 'timecop'

describe Peep do

  describe '.all' do
    it 'returns all peeps' do
      connection = PG.connect(dbname: 'chitter_test')
      connection.exec("INSERT INTO users (user_name, password, email) VALUES ('Slava', 'testpassword1', 'test@email.com');")
      connection.exec("INSERT INTO peeps (peep_text, time, user_id) VALUES ('Every application somehow needs PosgreSQL', '2022-05-13 15:24:57', 45);")
      
      peep = Peep.all[0]

      expect(peep['peep_text']).to eq 'Every application somehow needs PosgreSQL'
      expect(peep['time']).to eq '2022-05-13 15:24:57'
      expect(peep['user_name']).to eq 'Slava'
      # expect(peep['user_id']).to eq 45
    end
  end

  describe '.create' do
    it 'creates a new peep' do
      Timecop.freeze(Time.parse('2022-05-13 15:24:57')) do
        
        Peep.create(peep_text: 'Every application somehow needs PosgreSQL')
        
        peep = Peep.all[0]
        expect(peep['peep_text']).to eq 'Every application somehow needs PosgreSQL'
        expect(peep['time']).to eq '2022-05-13 15:24:57'
        expect(peep['user_name']).to eq 'Slava'
        # expect(peep['user_id']).to eq 45
      end
    end
  end

end