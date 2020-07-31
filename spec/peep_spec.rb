require 'peep'
describe Peep do
  describe '.all' do
    it 'shows a list of peeps' do
      peep = Peep.add(content: "This is a test peep")
      
      peeps = Peep.all

      expect(peeps.length).to eq 1
      expect(peeps.first).to be_a Peep
      expect(peeps.first.id).to eq peep.id
      expect(peeps.first.content).to eq 'This is a test peep'
    end
  end
  
  describe '.add' do
    it 'adds a peep to the database' do
      peep = Peep.add(content: "This is a test peep")
      persisted_data = DatabaseConnection.query("SELECT * FROM peeps WHERE id = '#{peep.id}';")
      expect(peep).to be_a Peep
      expect(peep.id).to eq persisted_data.first['id']
      expect(peep.content).to eq 'This is a test peep'
    end
  end
end
