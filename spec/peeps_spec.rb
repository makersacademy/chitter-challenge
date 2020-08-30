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

  end

  describe '#.new_peep' do
    it 'posts a new peep' do
       peep = Peeps.new_peep(text: "Test peep")
       expect(peep).to be_a Peeps
       expect(peep.text).to eq "Test peep"
    end
  end

   describe ".posted_at" do
     it 'displays the time each peep was posted at' do
       peep = Peeps.new(id: 1, text: "Test text", posted_at: '20:30:49')
       expect(peep.posted_at).to eq '20:30:49'
     end

     it 'displays the time each peep was posted at' do
       con = PG.connect :dbname => 'peeps_test'
       peep = Peeps.new_peep(text: "Test peep")
       peeps = Peeps.all
       expect(peeps.first.posted_at).to eq peep.posted_at
     end

   end

end
