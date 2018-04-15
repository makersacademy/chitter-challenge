require 'chitter'

describe Chitter do

  describe '.all' do

    it 'shows the name and message' do
      con = PG.connect(dbname: 'chitter_test')
      con.exec_params("INSERT INTO chitters(name, peep, timestamp) VALUES($1, $2, $3)", ["Bill Crosby", "Hello world!", "time"])
      expect(Chitter.all).to include ['Bill Crosby', 'Hello world!', "time"]
    end

  end

  describe '.create' do
    it 'creates name and message, includes timestamp' do
      time = (Time.now + (60*60)).strftime("%H:%M")
      Chitter.create({name: 'Cat person',peep: 'Miaow.', timestamp: time})
      expect(Chitter.all).to include ["Cat person", "Miaow.", time]
    end
  end

end
