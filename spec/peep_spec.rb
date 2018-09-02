require 'peep'

describe '.all' do
  describe 'can see all peeps' do
    it 'returns all peeps sent' do
      connection = PG.connect(dbname: 'chitter_test')

      connection.exec("INSERT INTO users (name, username, email, password) VALUES ('Harry Potter', 'Scarface', 
        'hpotter@gmail.com', 'Password123');")

      result = connection.exec('SELECT id FROM users') 
      user_id = result[0]['id']
      
      connection.exec("INSERT INTO peeps (peep, user_id) VALUES ('Hello', '#{user_id}');")
      connection.exec("INSERT INTO peeps (peep, user_id) VALUES ('Hey', '#{user_id}');")
      connection.exec("INSERT INTO peeps (peep, user_id) VALUES ('Hi', '#{user_id}');")

      peeps = Peep.all
      peep = peeps.first

      expect(peep.peep).to eq "Hi"
      expect(peeps.length).to eq 3

    end
  end
end

describe '.create' do
  describe 'can add a peep' do
    it 'returns a peep posted' do

      connection = PG.connect(dbname: 'chitter_test')

      connection.exec("INSERT INTO users (name, username, email, password) VALUES ('Harry Potter', 'Scarface', 
        'hpotter@gmail.com', 'Password123');")

      result = connection.exec('SELECT id FROM users') 
      user_id = result[0]['id']

      Peep.create("Hello peeps!", user_id)
      peep = Peep.all.first

      expect(peep.peep).to eq "Hello peeps!"
    end
  end
end
