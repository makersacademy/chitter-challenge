require 'message'

RSpec.describe Message do

  describe '#all' do
    it 'returns the list of peeps' do
      connection = PG.connect(dbname: 'chitter_peeps_test')
      connection.exec("INSERT INTO peeps VALUES(1, 'Hello!');")
      connection.exec("INSERT INTO peeps VALUES(2, 'Today is Saturday');")
      connection.exec("INSERT INTO peeps VALUES(3, 'Goodbye!');")

      peeps = Message.all

      expect(peeps).to include('Hello!')
      expect(peeps).to include('Today is Saturday')
      expect(peeps).to include('Goodbye!')
    end
  end

  # describe '#add' do
  #   it 'adds a peep to the list of peeps' do
  #     peep = Message.add('Brooke says HELLO')
  #     connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com');")
  #
  #   end
  # end

end
