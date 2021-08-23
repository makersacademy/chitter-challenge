require "./lib/peep.rb"
require "./spec/web_helper.rb"
require 'digest/sha1'

describe Peep do
  peep_hash = { peep: "As a Maker I just am X", foreign_key_username: "johndoe"}

  it "saves the new peep" do
    test_connect_and_clean_table(:peeps)
    add_return = described_class.add(peep_hash).last['id'].to_i
    created_row = described_class.find(add_return)
    expect(created_row.first[:peep]).to eq("As a Maker I just am X")
  end

end