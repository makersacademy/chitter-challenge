require 'peep'

describe 'Peep' do
  
  describe '.see_all' do
    it 'displays all peeps' do
      connection = PG.connect(dbname: 'peep_manager_test')
      connection.exec("INSERT INTO peeps (user_name, user_handle, peep, timestamp) VALUES ('Harry', '@thechosenone', 'Harry Potter thats me', '2020-01-19')")
      connection.exec("INSERT INTO peeps (user_name, user_handle, peep, timestamp) VALUES ('Ron', '@notthechosenone', 'Ron, Ron, Ron Weasley', '2020-01-19')")

      peeps = Peep.see_all

      expect(peeps.first.user_name).to eq "Harry"
    end
  end

  describe '.create' do
    it 'creates a new peep' do
      connection = PG.connect(dbname: 'peep_manager_test')
      peep = Peep.create(user_name: 'Ron', user_handle: '@notthechosenone', peep: 'Ron, Ron, Ron Weasley', timestamp: '2020-01-19')
    
      expect(peep).to be_a Peep
      expect(peep.user_name).to eq 'Ron'
      expect(peep.user_handle).to eq '@notthechosenone'
      expect(peep.timestamp).to eq '2020-01-19'
    end
  end
end
