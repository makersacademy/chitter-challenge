require '/Users/saritaradia/Desktop/Projects/chitter-challenge/chitter-challenge/app/Models/peep.rb'
require 'pg'
require 'time'
require 'timecop'

RSpec.describe Peep do
  # before do
  #   Timecop.freeze
  #   @time = Time.now.strftime("%H:%M, %d %B")
  # end
  describe ".all" do
    it "Returns an array of peep messages" do
      begin
        connection = PG.connect :dbname => 'chitter_test'
        connection.exec("INSERT INTO peeps (message, timestamp) VALUES('Test peep', '2022-10-19 10:23:54')")
      rescue PG::Error => e
        p e.message
      ensure
        connection.close if connection
      end

        peeps = Peep.all
        expect(peeps.first.message).to eq 'Test peep'
        expect(peeps.first.timestamp).to eq('2022-10-19 10:23:54')
    end
  end

  describe ".create" do
      it "Returns a peep instance" do
        Peep.create(message: 'Test CREATE peep', timestamp: '2000-10-10 00:00:00')
        peep = Peep.all
        expect(peep.first.message).to eq('Test CREATE peep')
        expect(peep.first.timestamp).to eq('2000-10-10 00:00:00')
      end

      it "Returns a different peep instance" do
        Peep.create(message: 'Newly created peep', timestamp: '2022-02-02 00:00:00')
        peep = Peep.all
        expect(peep.first.message).to eq('Newly created peep')
        expect(peep.first.timestamp).to eq('2022-02-02 00:00:00')
      end
    end
end
