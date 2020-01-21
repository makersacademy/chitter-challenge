require 'chitter'
require 'database_helpers'
describe Chitter do
  let(:time) { (:time)}
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
      chits = Chitter.create(message:"Hello World!")
      Chitter.create(message:"This is another peep.")
      Chitter.create(message:"This is a third peep")

      connection.exec("SELECT * FROM chits ORDER BY id DESC;")

      chitters = Chitter.all

      expect(chitters.last).to eq("Hello World!")
    end
  end

  describe '.create' do
    it "posts a new message" do
      chits = Chitter.create(message: 'Hello World!').first
      persisted_data = PG.connect(dbname: 'chitter_test').query("SELECT * FROM chits ORDER BY id DESC;")
      expect(chits['message']).to eq'Hello World!'
    end
  end
end
