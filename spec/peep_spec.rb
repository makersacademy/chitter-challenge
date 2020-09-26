require './lib/peep'
require_relative 'database_helpers'
require './lib/database_connection_setup'

describe Peep do
  
  context "#create"
  it "add and return the latest peep" do
    peep = Peep.create(text: "waddup")
    expect(peep.text).to eq "waddup"
  end

  context "#.all"
  it "returns a list of all peeps in descending order" do
    add_peeps
    peep_list = Peep.all
    expect(peep_list.length).to eq 3
    expect(peep_list.first.text).to eq 'Yo wadddup'
  end

end