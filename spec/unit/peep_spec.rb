require './app/models/peep.rb'

describe Peep do

  describe '#all' do
  it 'shows all peeps' do
    connection = PG.connect(dbname: 'peeps_db_test')
    connection.exec("INSERT INTO peeps (message) VALUES('test message');")

    peeps = Peep.all

    expect(peeps.first.message).to eq('test message')
  end
end

  describe '#create' do
    it 'returns a peep instance from database' do
      peep = Peep.create(message: 'test message')
      peeps = Peep.all
      expect(peeps).to include({:id=>"1", message=>'test message'})
    end
  end

end