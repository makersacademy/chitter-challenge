require 'peep'

describe Peep do
  let(:user) { double('instance of User class') }

  context '#initialize' do
    it 'inflates database information into instances of the Peep class' do
      peep = Peep.new(user: user, time: '1999-01-08 04:05:06', content: 'Oh hey chitter!', tagged_users: 'TODO')

      expect(peep.user).to eq user
      expect(peep.time).to eq '08/01/1999  4:05'
      expect(peep.content).to eq 'Oh hey chitter!'
      expect(peep.tagged_users).to eq 'TODO'
    end
  end

  context '.all' do
    it 'returns an array of Peep instances from the database' do
      # i dont think this one has stubbed out the User class as it's being created from within the all method directly from database
      user_id = DatabaseConnection.query("INSERT INTO Users(email, password, name, username) VALUES($1, $2, $3, $4) RETURNING id;", ['example@gmail.com', '*****', 'Birdy', 'fly_away'])
      parrot_id = DatabaseConnection.query("INSERT INTO Users(email, password, name, username) VALUES($1, $2, $3, $4) RETURNING id;", ['another_example@gmail.com', '*****', 'Parrot', 'ahoy_matey'])
      pete_id = DatabaseConnection.query("INSERT INTO Users(email, password, name, username) VALUES($1, $2, $3, $4) RETURNING id;", ['yet_another_example@gmail.com', '*****', 'Pete', 'pirate_p'])
      first_peep_id = DatabaseConnection.query("INSERT INTO Peeps(user_id, time, content) VALUES($1, $2, $3) RETURNING id;", [user_id[0]["id"].to_i, '1999-01-08 04:05:06', 'Oh hey chitter!'])
      DatabaseConnection.query("INSERT INTO Peeps(user_id, time, content) VALUES($1, $2, $3);", [user_id[0]["id"].to_i, '3000-01-08 04:05:06', "Man I'm getting old!"])
      DatabaseConnection.query("INSERT INTO junction_tagged_users(peep_id, user_id) VALUES($1, $2);", [first_peep_id[0]["id"].to_i, parrot_id[0]["id"].to_i])
      DatabaseConnection.query("INSERT INTO junction_tagged_users(peep_id, user_id) VALUES($1, $2);", [first_peep_id[0]["id"].to_i, pete_id[0]["id"].to_i])
      
      peeps = Peep.all

      expect(peeps.length).to eq 2
      expect(peeps.first).to be_a Peep
      expect(peeps.first.user.name).to eq 'Birdy'
      expect(peeps.first.user.username).to eq 'fly_away'
      expect(peeps.first.time).to eq '08/01/1999  4:05'
      expect(peeps.first.content).to eq 'Oh hey chitter!'
      expect(peeps.first.tagged_users).to eq ['ahoy_matey', 'pirate_pete']
    end
  end
end
