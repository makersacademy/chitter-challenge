require 'chitter'

describe Chitter do
  describe '.all' do
    it "shows all the mesages posted" do
      chitters = Chitter.all
      connection = PG.connect(dbname: 'chitter')
      # # Add the test data
      # chitter = Chitter.create(message: 'Hello World!')
      # Chitter.create(message: 'This is another peep.')
      # Chitter.create(message: 'This is a third peep')
      expect(chitters).to include("Hello World!")
      expect(chitters).to include("This is another peep.")
      expect(chitters).to include("This is a third peep")
    end

    it "shows messages posted in reverse chronological order" do
      expect(Chitter.all).to end_with("Hello World!")
    end
  end

  # describe '.create' do
  #   it "posts a new message" do
  #     Chitter.create(message: 'Hello World!')
  #     expect(Chitter.all).to include("Hello World!")
  #   end
  # end
end
