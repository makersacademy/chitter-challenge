require 'chitter'

describe Chitter do
  describe '.all' do
    it 'returns all peeps' do
      connection = PG.connect(dbname: 'chitter_test')

      connection.exec("INSERT INTO peeps (name,peep) VALUES ('Voldemort', 'I am a Pull Stack Developer. I pull things off the internet and put it in my code.');")
      connection.exec("INSERT INTO peeps (name,peep) VALUES('Gregorovitch', 'Debugging is like an onion. There are multiple layers to it, and the more you peel them back, the more likely you will cry.');")

      peeps = Chitter.all
      expect(peeps).to include("I am a Pull Stack Developer. I pull things off the internet and put it in my code.")
      expect(peeps).to include("Debugging is like an onion. There are multiple layers to it, and the more you peel them back, the more likely you will cry.")
    end
  end
end