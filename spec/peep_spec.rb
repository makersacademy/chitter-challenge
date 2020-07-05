require './lib/peeps'
require 'database_helpers'

describe Peep do
  describe '.all' do
    it 'returns a list of peeps' do
      connection = PG.connect(dbname: 'chitter_manager_test')
      peep = Peep.create(username: "makers", peep: "Hello, Twitter!")
      Peep.create(username: "katie1995", peep: "I love Makers!")


      peeps = Peep.all

      expect(peeps.length).to eq 2
      expect(peeps.last.id).to eq peep.id
      expect(peeps.last.username).to eq peep.username
      expect(peeps.last.peep).to eq 'Hello, Twitter!'
    end
  end

  describe '.create' do
    it 'creates new peeps' do
    peep = Peep.create(username: "makers", peep: "Hello, Twitter!")
    persisted_data = persisted_data(id: peep.id)

    expect(peep.id).to eq persisted_data['id']
    expect(peep.username).to eq 'makers'
    expect(peep.peep).to eq 'Hello, Twitter!'
    end
  end

end
