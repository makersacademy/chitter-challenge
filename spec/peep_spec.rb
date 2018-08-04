require 'date'
require 'time'
require './models/peep.rb'

describe Peep do

  let(:time) { Time.now }
  before do
    allow(Peep).to receive(:Time).and_return(time)
  end

  describe ".all" do
    it "returns all peeps in an array" do
      insert_test_peeps
      expected_peeps = [
        { :username => 'limcuili', :peep => 'I got peep.add to work as a method!', :date => time.strftime('%Y-%m-%d'), :time => time.strftime('%H:%M:%S') },
        { :username => 'limcuili', :peep => 'I can now post multiple peeps.', :date => time.strftime('%Y-%m-%d'), :time => time.strftime('%H:%M:%S') },
        { :username => 'limcuili', :peep => 'Let us add a third because I like #3', :date => time.strftime('%Y-%m-%d'), :time => time.strftime('%H:%M:%S') }
      ]
      expect(Peep.all).to eq expected_peeps
    end
  end

end
