require 'chitter'

describe Chitter do
  describe '.all' do
    it "shows all the mesages posted" do
      connection = PG.connect(dbname: 'chitter_test')
      # # Add the test data
      connection.exec("INSERT INTO chits (message) VALUES ('Hello World!');")
      connection.exec("INSERT INTO chits (message) VALUES('This is another peep.');")
      connection.exec("INSERT INTO chits (message) VALUES('This is a third peep');")

      chitters = Chitter.all

      expect(chitters).to include("Hello World!")
      expect(chitters).to include("This is another peep.")
      expect(chitters).to include("This is a third peep")
    end

    it "shows messages posted in reverse chronological order" do
      connection = PG.connect(dbname: 'chitter_test')
      # # Add the test data
      connection.exec("INSERT INTO chits (message) VALUES ('Hello World!');")
      connection.exec("INSERT INTO chits (message) VALUES('This is another peep.');")
      connection.exec("INSERT INTO chits (message) VALUES('This is a third peep');")

      connection.exec("SELECT * FROM chits ORDER BY id DESC;")

      chitters = Chitter.all

      expect(chitters).to end_with("Hello World!")
    end
    it "shows messages posted with their time" do
      connection = PG.connect(dbname: 'chitter_test')
      # # Add the test data
      connection.exec("INSERT INTO chits (message) VALUES ('Hello World!');")
      connection.exec("INSERT INTO chits (message) VALUES('This is another peep.');")
      connection.exec("INSERT INTO chits (message) VALUES('This is a third peep');")

      chitters = Chitter.all
      expect(chitters).to include(Time.now)
    end
  end

  describe '.create' do
    it "posts a new message" do
      chits = Chitter.create(message: 'Hello World!', time: Time.now).first
      expect(chits['message']).to eq'Hello World!'
      expect(chits['time']).to eq Time.now
    end
  end
end
