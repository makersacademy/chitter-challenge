require 'chitter'

describe Chitter do

  describe '.list' do
    it 'display all the peeps' do
      user = instance_double('User', :id => 45, :username => 'sandy974')
      peep = "Who wants to know what I had for lunch?!"

      # connection = PG.connect :dbname => "chitter_#{ENV['RACK_ENV']}"
      # insertion = connection.exec("INSERT INTO peeps (user_id, posted_time, content) VALUES('#{user.id}', current_timestamp, '#{peep}') RETURNING RETURNING id, ")
      Chitter.create()

      feed = Chitter.list
      expect(feed.first.username).to eq 'sandy974'
      expect(feed.first.content).to eq peep
    end
  end

  describe '.create' do
    it 'creates a new peep' do
      connection = PG.connect :dbname => "chitter_#{ENV['RACK_ENV']}"
      insertion = connection.exec("INSERT INTO users (name, lastname, username, email, password) VALUES('Sandy', 'Lowe', 'sandy974', 'xyz@gmail.com', '1234') RETURNING id, username")
      # p insertion.first
      peep = "Who wants to know what I had for lunch?!"

      demo_peep = Chitter.create(insertion.first['username'], peep) # demo_peep = {id =xx, posted_time=timestamp, content= peep}
      # p demo_peep
      expect(demo_peep.content).to eq peep
      expect(demo_peep.username).to eq 'sandy974'
      expect(demo_peep.posted_time).to_not be nil
    end
  end
end
