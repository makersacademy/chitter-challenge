require 'chitter'

describe Chitter do

  describe '.all' do
    it 'returns all peeps'
    connection = PG.connect(dbname: 'chitter_manager_test')
    connection.exec("INSERT INTO chitters (peep) VALUES ('Hello, World!');")

    chitters = Chitter.all

    expect(chitters).to include('Hello, World!')
  end
end
