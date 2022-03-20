require 'peep_manager'

describe PeepManager do
  let(:fake_peep) { { 'content' => 'I am an example Peep' } }
  let(:fake_peep_template) { double(:peep_class_double, :new => fake_peep) }
  let(:fake_db_manager) { double(:db_manager_double, :query => [fake_peep]) }
  subject(:peep_manager) { described_class.new(fake_db_manager) }
  
  describe '#add' do
    it 'adds a new peep to the database' do
      example_peep = { 'content' => 'I am another example Peep' }
      sql_query = "INSERT INTO peeps (content) VALUES ($1)"
      peep_manager.add(example_peep['content'])
      allow(fake_db_manager).to receive(:query)
      expect(fake_db_manager).to have_received(:query).with(sql_query, example_peep['content'])
    end
  end

  describe '#all_peeps' do
    context 'when there are no peeps' do
      it 'returns an array containing an Error Peep' do
        allow(peep_manager).to receive(:peeps_from_database) { nil }
        peeps = peep_manager.all_peeps
        error_peep = peeps.first
        expect(error_peep.content).to eq PeepManager::NO_PEEPS_MESSAGE
      end
    end
    context 'when there are peeps' do
      it 'returns an array of the current peeps' do
        peep_manager.add(fake_peep['content'])
        first_peep = peep_manager.all_peeps.first
        expect(first_peep.content).to eq fake_peep['content']
      end
    end
  end

  describe '#peeps_from_database' do
    it 'querys the database for all the peeps' do
      sql_query = "SELECT * FROM peeps ORDER BY created DESC"
      peep_manager.peeps_from_database
      allow(fake_db_manager).to receive(:query)
      expect(fake_db_manager).to have_received(:query).with(sql_query)
    end
  end
end
