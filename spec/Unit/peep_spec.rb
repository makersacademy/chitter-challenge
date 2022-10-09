require '/Users/saritaradia/Desktop/Projects/chitter-challenge/chitter-challenge/app/Models/peep.rb'
require 'pg'
require 'time'
require 'timecop'

describe Peep do
  # before do
  #   Timecop.freeze
  #   @time = Time.now.strftime("%H:%M, %d %B")
  # end

  describe ".all" do
    it "Returns an array of peep messages" do
      begin
      connection = PG.connect :dbname => 'chitter_test'
      connection.exec("INSERT INTO peeps (message, username, fullname, timestamp) VALUES('Test peep', 'testuser22', 'Test Name', '2022-10-19 10:23:54')")

      rescue PG::Error => e
        puts e.message
      ensure
        connection.close if connection
        end

        peeps = Peep.all
        expect(peeps.first.message).to eq 'Test peep'
        expect(peeps.first.username).to eq('testuser22')
        expect(peeps.first.fullname).to eq('Test Name')
        expect(peeps.first.timestamp).to eq('2022-10-19 10:23:54')
    end
  end

  describe ".create" do
      it "Returns a peep instance" do
        Peep.create(message: 'Test CREATE peep', fullname: 'TestCreate Name', timestamp: '2000-10-10 00:00:00', username: 'TestCREATEuser' )
        peep = Peep.all
        expect(peep.first.message).to eq('Test CREATE peep')
        expect(peep.first.fullname).to eq('TestCreate Name')
        expect(peep.first.timestamp).to eq('2000-10-10 00:00:00')
        expect(peep.first.username).to eq('TestCREATEuser')
      end
    end
end
