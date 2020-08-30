require './lib/peeps'
require 'setup_test_database'

describe Peeps do

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

    it 'displays the time each peep was posted at' do
      con = PG.connect :dbname => 'peeps_test'
      peep = Peeps.new_peep(text: "Test peep")

      peeps = Peeps.all

      expect(peeps.first.posted_at).to eq peep.posted_at
    end

  end

  describe '#.new_peep' do
    it 'posts a new peep' do
       peep = Peeps.new_peep(text: "Test peep")
       expect(peep).to be_a Peeps
       expect(peep.text).to eq "Test peep"
    end
  end

  let(:peep) { Peeps.new_peep(text: "Test peep") }

   describe "#posted_at" do
     it 'checks an accurate time and date are posted with every peep' do
       expect(peep).to respond_to(:posted_at)
       expect(peep.posted_at).to be_a_kind_of(Time)
     end
   end

end
