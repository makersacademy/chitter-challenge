require 'chitter'

describe Chitter do

  describe '.all' do

    it 'shows the name and message' do
      con = PG.connect(dbname: 'chitter_test')
      con.exec_params("INSERT INTO chitters(name, peep) VALUES($1, $2)", ["Bill Crosby", "Hello world!"])
      expect(Chitter.all).to include ['Bill Crosby', 'Hello world!']
    end

  end

  describe '.create' do
    it 'creates name and message, includes timestamp' do
      time = Time.now + (60*60)
      Chitter.create({name: 'Cat person',peep: 'Miaow.', timestamp: "#{time.strftime("%H:%M")}"})
      expect(Chitter.all).to include ["Cat person", "Miaow.", "#{time.strftime("%H:%M")}"]
    end
  end

end
