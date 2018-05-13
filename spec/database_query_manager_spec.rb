require './app/lib/database_query_manager'

describe DatabaseQueryManager do
  describe '#all' do
    it 'should return an PG::Result object from the database' do
      expect(described_class.all).to be_an_instance_of(PG::Result)
    end
  end
end