require 'peep'

describe '.all' do
  it 'returns a list of peeps' do
      connection = PG.connect(dbname: 'chitter_test')

    connection.exec("INSERT INTO peeps (text) VALUES('This is my first peep');")
    connection.exec("INSERT INTO peeps (text) VALUES('Happy Saturday:)');")


    peeps = Peep.all

    expect(peeps).to include "This is my first peep"
    expect(peeps).to include "Happy Saturday:)"
  end

  describe '/.create' do
    it 'creates a new peep' do
      Peep.create(text: 'Have a good weekend')
    end 
  end
end
