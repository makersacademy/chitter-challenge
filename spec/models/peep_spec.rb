require_relative '../../lib/database_connection'
require_relative '../../lib/models/peep'
describe Peep do
  context '#all' do
    it 'can retrieve all peeps' do
      10.times do |num|
        DatabaseConnection.query("INSERT INTO peeps (content) VALUES ('This is a test peep #{num}')")
      end
      expect(Peep.all.first.content).to include ('This is a test peep 0')
      expect(Peep.all.last.content).to include ('This is a test peep 9')
    end
  end

  context '#create' do
    it 'creates a new peep' do
      10.times do |num|
        Peep.create(content: "This is a test peep #{num}")
      end
      expect(Peep.all.first.content).to include ('This is a test peep 0')
      expect(Peep.all.last.content).to include ('This is a test peep 9')
    end
  end

  context '#find' do
    it 'can return a particular peep' do
      10.times do |num|
        Peep.create(content: "This is a test peep #{num}")
      end

      expect(Peep.find(id: 2).content).to match('This is a test peep 1')
    end
  end

  context '#update' do
    it 'can update a particular peep' do
      10.times do |num|
        Peep.create(content: "This is a test peep #{num}")
      end

      Peep.update(id: 2, content: "This is an updated peep")
      expect(Peep.find(id: 2).content).to match('This is an updated peep')
    end
  end

  context '#delete' do
    it 'can return a particular peep' do
      10.times do |num|
        Peep.create(content: "This is a test peep #{num}")
      end

      Peep.delete(id: 2)
      expect( Peep.find(id: 2) ).to eq(nil)
    end
  end
end
