require 'peep'
require 'user'

describe Peep do

  describe '.all' do
    it 'returns list of peeps' do
      connection = PG.connect(dbname: 'chitter_test')
      user = User.create(name: 'SteveSmith', email: 'steve@smith.com', username: 'Stevo', password: 'Steve123')
      connection.exec("INSERT INTO peeps (id, user_id, peep, time) VALUES (1, #{user.id}, 'This is a test', '10/27/2018 17:36');")
      # connection.exec("INSERT INTO users (name, email, username, password) VALUES ('SteveSmith', 'steve@smith.com', 'Stevo', 'steve123');")
      # user = User.create(name: 'RaySmith', email: 'ray@smith.com', username: 'RayRay', password: 'ray123')
      # user = User.create(name: 'SteveSmith', email: 'steve@smith.com', username: 'Stevo', password: 'Steve123')

      peeps = Peep.all

      expect(peeps.length).to eq 1
      expect(peeps.first).to be_a Peep
      #expect(peeps.first.user_id).to eq user.id
      expect(peeps.first.peep).to eq 'This is a test'
      expect(peeps.first.time).to eq '2018-10-27 17:36:00'

      user_peep = user.peeps.first
      expect(user_peep['peep']).to eq 'This is a test'
    end
  end

  describe '.create' do
    it 'creates a new peep when the user posts' do
      user = User.create(name: 'RaySmith', email: 'smith.raylene@gmail.com', username: 'RayRay', password: 'password123')
      peep = Peep.create(user_id: user.id, peep: 'Another test')

      expect(peep.peep).to eq 'Another test'
    end
  end

end
