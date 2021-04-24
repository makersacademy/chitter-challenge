require 'peep'
describe Peep do
  let(:subject) {Peep.new("1", "Hello world")}
  describe 'peep' do
    it 'responds to id' do
      expect(subject).to respond_to(:id)
    end

    it 'responds to texts' do
      expect(subject).to respond_to(:texts)
    end
  end
  
  describe '.all' do
    it 'returns all peeps' do
      connection = PG.connect(dbname: 'chitter_test')
      connection.exec("INSERT INTO peeps (id, texts) VALUES ('1', 'Hello world');")
      peeps = Peep.all
      expect(peeps.first.texts).to eq("Hello world")
    end
  end

  describe '.create' do
    it 'creates a peep' do
      connection = PG.connect(dbname: 'chitter_test')
      peeps = Peep.create("Hello Chitter world")
      expect(Peep.all).to include("Hello Chitter world")
    end
  end

end