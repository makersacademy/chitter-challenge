require 'message'

RSpec.describe Message do

  describe '#all' do
    it 'returns the list of peeps' do
      connection = PG.connect(dbname: 'chitter_peeps_test')
      connection.exec("INSERT INTO peeps VALUES(1, 'Hello!', '2019-02-03 14:36:09');")
      connection.exec("INSERT INTO peeps VALUES(2, 'Today is Saturday', '2019-02-03 14:38:09');")
      connection.exec("INSERT INTO peeps VALUES(3, 'Goodbye!', '2019-02-03 14:39:09');")

      peeps = Message.all

      expect(peeps[2].peep).to include('Hello!')
      expect(peeps[1].peep).to include('Today is Saturday')
      expect(peeps[0].peep).to include('Goodbye!')
    end
  end

  describe '#add' do
    it 'adds a peep to the list of peeps' do
      new_peep = Message.add(peep: 'Brooke says HELLO')
      connection = PG.connect(dbname: 'chitter_peeps_test')
      connection.exec("INSERT INTO peeps (peep) VALUES ('Brooke says HELLO');")
      expect(new_peep.peep).to eq('Brooke says HELLO')
    end

  end

end
