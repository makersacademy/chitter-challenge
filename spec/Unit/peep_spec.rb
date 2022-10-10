require '/Users/saritaradia/Desktop/Projects/chitter-challenge/chitter-challenge/app/Models/peep.rb'
require 'pg'
require 'time'
require 'timecop'

def reset_tables
  seeds = File.read('/Users/saritaradia/Desktop/Projects/chitter-challenge/chitter-challenge/db/Real_Seeds/chitter_seeds.sql')
  connection = PG.connect({host: '127.0.0.1', dbname: 'chitter_test'})
  connection.exec(seeds)
end

RSpec.describe Peep do
  # before do
  #   Timecop.freeze
  #   @time = Time.now.strftime("%H:%M, %d %B")
  # end

  before(:each) do
    reset_tables
  end
  describe ".all" do
    it "Returns an array of peep messages" do
      #This also resets the table, but the above is easier to read
      # begin
      #   connection = PG.connect :dbname => 'chitter_test'
      #   connection.exec("INSERT INTO peeps (message, timestamp) VALUES('Test peep', '2022-10-19 10:23:54')")
      # rescue PG::Error => e
      #   p e.message
      # ensure
      #   connection.close if connection
      # end

        peeps = Peep.all
        expect(peeps.first.message).to eq 'Peppermint tea is the best'
        expect(peeps.first.timestamp).to eq('2022-10-10 03:00:00')
    end
  end

  describe ".create" do
      it "Returns a peep instance" do
        Peep.create(message: 'Test CREATE peep', timestamp: '2000-10-10 00:00:00')
        peep = Peep.all
        expect(peep.last.message).to eq('Test CREATE peep')
        expect(peep.last.timestamp).to eq('2000-10-10 00:00:00')
      end

      it "Returns a different peep instance" do
        Peep.create(message: 'Newly created peep', timestamp: '2022-02-02 00:00:00')
        peep = Peep.all
        expect(peep.last.message).to eq('Newly created peep')
        expect(peep.last.timestamp).to eq('2022-02-02 00:00:00')
      end
    end
end
