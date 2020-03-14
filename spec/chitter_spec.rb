require 'chitter'

describe Chitter do
  context '#print_peeps' do
    it 'can print a list with all peeps' do
      connection = PG.connect(dbname: 'chitter_test')

      # Add the test data
      connection.exec("INSERT INTO peeps (message) VALUES ('I am the first peep');")
      connection.exec("INSERT INTO peeps (message) VALUES('And I am the second one');")

      chitter = Chitter.print_peeps

      # How to test they are displayed in order?

      expect(chitter).to include ('I am the first peep')
      expect(chitter).to include ('And I am the second one')
    end
  end
end
