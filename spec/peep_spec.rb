require 'peep'

describe Peep do

  describe '.all' do
    it 'returns list of peeps' do
      connection = PG.connect(dbname: 'chitter_test')
      connection.exec("INSERT INTO peeps (user_id, peep, time) VALUES ('1', 'This is a test', '10/27/2018 17:36');")
      # connection.exec("INSERT INTO users (name, email, username, password) VALUES ('SteveSmith', 'steve@smith.com', 'Stevo', 'steve123');")
      # user = User.create(name: 'RaySmith', email: 'ray@smith.com', username: 'RayRay', password: 'ray123')
      # user = User.create(name: 'SteveSmith', email: 'steve@smith.com', username: 'Stevo', password: 'Steve123')

      peeps = Peep.all

      expect(peeps.length).to eq 1
      expect(peeps.first).to be_a Peep
      expect(peeps.first.user_id).to eq '1'
      expect(peeps.first.peep).to eq 'This is a tset'
      expect(peeps.first.username).to eq '10/27/2018 17:36'
    end
  end

end
