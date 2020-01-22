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

      expect(chitters.length).to eq 3
      expect(chitters.first).to be_a Chitter
    end

    it "shows messages posted in reverse chronological order" do
      connection = PG.connect(dbname: 'chitter_test')
      # # Add the test data
      chits = Chitter.create(message:"Hello World!")
      Chitter.create(message:"This is another peep.")
      Chitter.create(message:"This is a third peep")

      connection.exec("SELECT * FROM chits ORDER BY id DESC;")

      chitters = Chitter.all

      expect(chitters.last.message).to eq("Hello World!")
    end
  end

  describe '.create' do
    it "posts a new message" do
      chits = Chitter.create(message: 'Hello World!').first
      persisted_data = PG.connect(dbname: 'chitter_test').query("SELECT * FROM chits ORDER BY id DESC;")
      expect(chits['message']).to eq'Hello World!'
    end
  end

  describe "time" do
    before do
      @fake_time = Time.now
      allow(Time).to receive(:now) { @fake_time }
    end
    it "is equal" do
      expect(Time.now).to eq Time.now
    end
    it "is close" do
      expect(Time.now).to be_within(0.1).of(Time.now)
    end
  end
end
