require './lib/peep'

describe Peep do 
  describe '.all' do
    it 'returns all peep records' do 

      connection = PG.connect(dbname: 'chitter_test')

    # Add the test data
      connection.exec("INSERT INTO peep_record (text) VALUES ('This is a test peep');")
      connection.exec("INSERT INTO peep_record (text) VALUES('This is a second test');")
      connection.exec("INSERT INTO peep_record (text) VALUES('This is a third test');")

      peep_all = Peep.all 

      expect(peep_all).to include('This is a test peep')
      expect(peep_all).to include('This is a second test')
      expect(peep_all).to include('This is a third test')
    end 

    it "returns Peeps in reverse chronological order" do 
 
      Peep.create(text: "This is the first (earlier) peep", time: Time.new(2020,02,02))
      Peep.create(text: "This is the second (later) peep", time: Time.new)

      expect(Peep.all.first).to eq('This is the second (later) peep')
    end 
  end 

  describe '.create' do 
    it 'creates a new peep post' do 
      time = Time.new
      
      Peep.create(text: 'This is a new test peep', time: "#{time}")

      expect(Peep.all).to include 'This is a new test peep'
    end 
  end 
end 
