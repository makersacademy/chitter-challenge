require 'makers'

describe Makers do

  describe '.all' do
    it 'returns the new members name' do
      connection = PG.connect(dbname: 'chitter_members_test')

      connection.exec("INSERT INTO chitter_members_data (username) VALUES ('Oli Le Maire');")
      connection.exec("INSERT INTO chitter_members_data (username) VALUES ('John Smith');")

      makers = Makers.all
      expect(makers).to include "Oli Le Maire"
      expect(makers).to include "John Smith"
    end
  end
end
