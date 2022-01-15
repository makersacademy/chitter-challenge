ENV['ENVIRONMENT'] == 'test'

describe '.all' do
  it 'returns a list of peeps' do
    connection = PG.connect(dbname: 'chitter_test')

    connection.exec("INSERT INTO peeps (peep) VALUES ('Test peep 1 peeps spec');")
    connection.exec("INSERT INTO peeps (peep) VALUES('Test peep 2');")
    connection.exec("INSERT INTO peeps (peep) VALUES('Test peep 3');")

    peeps = Peep.all

    expect(peeps).to include('Test peep 1 peeps spec')
    expect(peeps).to include('Test peep 2')
    expect(peeps).to include('Test peep 3')
  end

  describe '.create' do
    it 'creates a new peep' do
      Peep.create(message: 'Testing, testing, 1, 2, 3')
  
      expect(Peep.all).to include 'Testing, testing, 1, 2, 3'
    end 
  end 
end
