require 'chitter'


describe Cheep do
  describe '.all' do
    it 'returns all cheeps' do
    connection = PG.connect(dbname: 'chitter_test')

    connection.exec("INSERT INTO chitter (cheep) VALUES ('Hello Chitter!');")
    connection.exec("INSERT INTO chitter (cheep) VALUES ('What shall I eat for dinner?');")
    connection.exec("INSERT INTO chitter (cheep) VALUES (':)');")


    cheeps = Cheep.all 

    expect(cheeps).to include('Hello Chitter!')
    expect(cheeps).to include('What shall I eat for dinner?')
    expect(cheeps).to include(':)')
    end
  end
end