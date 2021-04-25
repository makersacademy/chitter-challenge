require 'databaseconnection'
require 'pg'
require './lib/peep'

describe DatabaseConnection do
  it 'responds to .setup' do
   expect(DatabaseConnection).to respond_to(:setup).with(1).argument
  end

  it 'responds to .query' do
    expect(DatabaseConnection).to respond_to(:query).with(1).argument
  end

  describe '.setup()' do
    it 'connects to a database' do
      expect(PG).to receive(:connect).with(dbname: "chitter_test")
      DatabaseConnection.setup("chitter_test")
    end
  end

  describe '.query' do
    it 'carrys out a query' do
      DatabaseConnection.setup("chitter_test")
      DatabaseConnection.query("INSERT INTO peeps (id, texts) VALUES ('1', 'Hello world');")
      result = DatabaseConnection.query("SELECT * FROM peeps;")
      msg = result.map do |row| [row["id"], row["texts"] ] end
      expect(msg[0][1]).to eq('Hello world')
    end
  end
end