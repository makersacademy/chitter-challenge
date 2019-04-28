require_relative './web_helpers.rb'
require 'peep'

# As a Maker
# So that I can let people know what I am doing
# I want to post a message (peep) to chitter

describe Peep do

  let(:peeps) { Peep.all }

  describe '#all' do
    it "is a list of peeps" do
      add_test_peeps

      expect(peeps.length).to eq 3
      expect(peeps.first).to be_a String
    end
  end

# As a maker
# So that I can see what others are saying
# I want to see all peeps in reverse chronological order

  describe '#post' do
    it "posts a peep to chitter in reverse order" do
      Peep.post("i <3 peeping")

      expect(peeps.first).to eq "i <3 peeping"
    end
  end
end
