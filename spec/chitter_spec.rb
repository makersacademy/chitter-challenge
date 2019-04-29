require_relative './web_helpers.rb'
require 'peep'
require 'time'

# As a Maker
# So that I can let people know what I am doing
# I want to post a message (peep) to chitter

describe Peep do

  let(:peeps) { Peep.all }
  let(:time) { Time.now.to_s }

  describe '#all' do
    it "is a list of peeps" do
      add_test_peeps

      expect(peeps.length).to eq 3
      expect(peeps.first).to be_a Peep
    end
  end

# As a maker
# So that I can see what others are saying
# I want to see all peeps in reverse chronological order

  describe '#post' do
    it "posts a peep to chitter in reverse order" do
      add_test_peeps
      Peep.post(peep: "i <3 peeping")

      expect(peeps.first.peep).to eq "i <3 peeping"
    end
  end

# As a Maker
# So that I can better appreciate the context of a peep
# I want to see the time at which it was made

  describe 'time' do
    it "stores the current time at creation" do
      test_peep_time = time[11..15]
      test_peep_date = time[8..9] + "-" + time[5..6] + "-" + time[2..3]
      Peep.post(peep: "to peep or not to peep")

      expect(peeps.first.time).to eq test_peep_time
      expect(peeps.first.date).to eq test_peep_date
    end
  end

end
