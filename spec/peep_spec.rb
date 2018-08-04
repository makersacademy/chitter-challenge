require './models/peep.rb'

describe Peep do

  subject(:peeps) { described_class }
  let(:time)      { Time.now        }
  before do
    allow(peeps).to receive(:Time).and_return(time)
  end

  describe ".all" do
    it "Returns all peeps as an array of hashes" do
      enter_test_peeps
      expected_peeps =
      [
        { :name => "Marek", :peep => "This is my first peep!", :time => time.strftime('%H:%M:%S'), :date => time.strftime('%Y:%m:%d') },
        { :name => "Ed", :peep => "Test peep number one", :time => time.strftime('%H:%M:%S'), :date => time.strftime('%Y:%m:%d') },
        { :name => "Yoda", :peep => "Powerful you have become, the dark side I sense in you.", :time => time.strftime('%H:%M:%S'), :date => time.strftime('%Y:%m:%d') }
      ]
      expect(peeps.all).to eq expected_peeps
    end
  end

  describe ".add" do
    it "Adds the new peep to the database including name, peep, time, and date" do
      peeps.add("Obi-Wan", "Be mindful of your thoughts Anakin. They’ll betray you.")
      expect(peeps.all).to eq [{ :name => "Obi-Wan", :peep => "Be mindful of your thoughts Anakin. They’ll betray you.", :time => time.strftime('%H:%M:%S'), :date => time.strftime('%Y:%m:%d') }]
    end
  end

end
