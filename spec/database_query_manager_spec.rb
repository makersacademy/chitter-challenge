require './app/lib/database_query_manager'

describe DatabaseQueryManager do
  describe '#all_peeps' do
    it 'should return an PG::Result object from the database' do
      expect(described_class.all_peeps).to be_an_instance_of(PG::Result)
    end
  end

  describe '#all_authors' do
    it 'should return an PG::Result object from the database' do
      expect(described_class.all_users).to be_an_instance_of(PG::Result)
    end
  end
end