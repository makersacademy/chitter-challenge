require 'postgresql_manager'
# require 'pg'

describe PostgresqlManager do
  describe '#initialize' do
    # subject {described_class.setup('diary_test')}
    it 'should return a connection to the database' do
      described_class.setup('diary_test')
      expect(described_class.connection).to be_a(PG::Connection)
    end
  end

  describe '.connect' do
    it 'should connect to test database' do
      expect(PostgresqlManager.connection).to be_a(PG::Connection)
    end
  end
end
