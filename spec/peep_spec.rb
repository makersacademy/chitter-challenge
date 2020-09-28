require './lib/peep'
require_relative 'database_helpers'
require './lib/database_connection_setup'

describe Peep do
  
  describe "#create" do
    it "add and return the latest peep" do
     peep = Peep.create(text: "waddup")
     expect(peep.text).to eq "waddup"
    end
  end

  describe "#.all" do

    it "returns a list of all peeps in descending order" do
     add_peeps
     peep_list = Peep.all
     expect(peep_list.length).to eq 3
     expect(peep_list.first.text).to eq 'Yo wadddup'
    end

    it 'returns the time a peep was created' do
      add_peeps
      peep_list = Peep.all
      expect(peep_list.first.date).to eq Time.now.strftime "%d %b %H:%M:%S"
    end
  end
end