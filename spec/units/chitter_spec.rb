require 'chitter'

describe Chitter do

  describe '.list' do
    it 'display all the peeps' do
      connection = PG.connect :dbname => "chitter_#{ENV['RACK_ENV']}"
      demo_user_one = connection.exec("INSERT INTO users (name, lastname, username, email, password) VALUES('Hannah', 'Lowe', 'hanalo13', 'test@gmail.com', '1234') RETURNING id, name, lastname, username, email, password").first
      demo_user_two = connection.exec("INSERT INTO users (name, lastname, username, email, password) VALUES('Sandy', 'Pounoussamy', 'sandy974', 'mytest@gmail.com', '1234') RETURNING id, name, lastname, username, email, password").first
      peep_one = "Who wants to know what I had for lunch?!"
      peep_two = "My cat is so cute"

      Chitter.create('hanalo13', peep_one)
      Chitter.create('sandy974', peep_two)
      feed = Chitter.list

      expect(feed[0].username).to eq demo_user_one['username']
      expect(feed[0].content).to eq peep_one
      expect(feed[1].username).to eq demo_user_two['username']
      expect(feed[1].content).to eq peep_two
    end
  end

  describe '.create' do
    it 'creates a new peep' do
      connection = PG.connect :dbname => "chitter_#{ENV['RACK_ENV']}"
      insertion = connection.exec("INSERT INTO users (name, lastname, username, email, password) VALUES('Sandy', 'Lowe', 'sandy974', 'xyz@gmail.com', '1234') RETURNING id, username")

      peep = "Who wants to know what I had for lunch?!"
      demo_peep = Chitter.create(insertion.first['username'], peep) 

      expect(demo_peep.content).to eq peep
      expect(demo_peep.username).to eq 'sandy974'
      expect(demo_peep.posted_time).to_not be nil
    end
  end
end
