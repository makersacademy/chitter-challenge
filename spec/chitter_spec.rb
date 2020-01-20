require 'chitter'
describe Chitter do
  describe '.all' do
    it "shows all the mesages posted" do
      expect(Chitter.all).to include("Hello World!")
    end
  end
end
