require 'chitter'

describe Chitter do
  describe '.all' do
    it "shows all the mesages posted" do
      connection = PG.connect(dbname: 'chitter')
      expect(Chitter.all).to include("Hello World!")
    end
  end

  describe '.create' do
    it "posts a new message" do
      Chitter.create(message: 'Hello World!')
      expect(Chitter.all).to include("Hello World!")
    end
  end
end
