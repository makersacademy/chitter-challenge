require_relative './web_helpers.rb'
require 'chitter'

# As a Maker
# So that I can let people know what I am doing
# I want to post a message (peep) to chitter

describe Chitter do
  describe 'all' do
    it "shows a list of peeps" do
      add_test_peeps
      chitter = Chitter.all
      expect(chitter).to include("eating a carrot, YOLO!")
      expect(chitter).to include("these are my political onions")
      expect(chitter).to include("plums are the best, down with the apples")
    end
  end
end
