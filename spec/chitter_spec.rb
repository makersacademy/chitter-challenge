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

      chitters = Chitter.all

      expect(chitters).to end_with("Hello World!")
    end
  end

  # describe '.create' do
  #   it "posts a new message" do
  #     Chitter.create(message: 'Hello World!')
  #     expect(Chitter.all).to include("Hello World!")
  #   end
  # end
end
