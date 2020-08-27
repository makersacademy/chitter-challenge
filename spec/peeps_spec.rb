require './lib/peeps'
require 'setup_test_database'

describe '.all' do
  it 'displays list of peeps' do
     con = PG.connect :dbname => 'peeps_test'
      peep = Peeps.new_peep(text: "Test peep")
      Peeps.new_peep(text: "Second")

      peeps = Peeps.all

      expect(peeps.length).to eq(2)
      expect(peeps.first).to be_a Peeps
      expect(peeps.first.id).to eq peep.id
      expect(peeps.first.text).to eq 'Test peep'
  end

  it 'displays the list of peeps in reverse chronological order' do

  end
end
