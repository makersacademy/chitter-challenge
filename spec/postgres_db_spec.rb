require_relative '../db/queries/postgres_db'
describe PGDatabase do

  context 'make connection' do

    it 'connects' do
      expect(PG).to receive(:connect).with(dbname: 'chitter_test', :user => ENV['DBUSER'], :password => ENV['DBPASSWORD'] )
      PGDatabase.connect('chitter_test')
    end

    it 'stores connection' do
      con = described_class.connect('chitter_test')
      expect(described_class.connection).to eq con
    end

  end

end
