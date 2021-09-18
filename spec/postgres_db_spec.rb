require_relative '../db/queries/postgres_db'
describe PGDatabase do

  context 'make connection' do

    it 'connects' do
      expect(PG).to receive(:connect).with(dbname: 'chitter_test', :user => ENV['DBUSER'], :password => ENV['DBPASSWORD'] )
      PGDatabase.connect('chitter_test')
    end

    # The connection is stored, but this is making another connection which I think overrides the connection in feature_helper (sets con = nil)
    # had to use a hook in the before in spec_helper as advised here:
    # https://stackoverflow.com/questions/34417737/beforeeach-for-all-tests-except-one
    it 'stores connection', :store_connection do
      con = described_class.connect('chitter_test')
      expect(described_class.con).to eq con
    end

  end

end
