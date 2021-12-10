require 'peep'

describe Peep do
  context '#initialize' do
    it 'inflates database information into instances of the Peep class' do
      peep = Peep.new(name: 'Birdy', username: 'fly_away', time: '1999-01-08 04:05:06', content: 'Oh hey chitter!', tagged_users: 'Croc')

      expect(peep.name).to eq 'Birdy'
      expect(peep.username).to eq 'fly_away'
      expect(peep.time).to eq '1999-01-08 04:05:06'
      expect(peep.content).to eq 'Oh hey chitter!'
      expect(peep.tagged_users).to eq 'Croc'
    end
  end

  context '.all' do
    it 'returns an array of Peep instances from the database' do
      DatabaseConnection.query("INSERT INTO Users(email, password, name, username) VALUES($1, $2, $3, $4);", ['example@gmail.com', '*****', 'Birdy', 'fly_away'])
      user_id = DatabaseConnection.query("SELECT id FROM Users WHERE email = 'example@gmail.com';")
      DatabaseConnection.query("INSERT INTO Peeps(user_id, time, content) VALUES($1, $2, $3);", [user_id[0]["id"].to_i, '1999-01-08 04:05:06', 'Oh hey chitter!'])
      DatabaseConnection.query("INSERT INTO Peeps(user_id, time, content) VALUES($1, $2, $3);", [user_id[0]["id"].to_i, '3000-01-08 04:05:06', "Man I'm getting old!"])
    
      peeps = Peep.all

      expect(peeps.length).to eq 2
      expect(peeps.first.name).to eq 'Birdy'
      expect(peeps.first.username).to eq 'fly_away'
      expect(peeps.first.time).to eq '1999-01-08 04:05:06'
      expect(peeps.first.content).to eq 'Oh hey chitter!'
      expect(peeps.tagged_users).to eq nil
    end
  end
end
