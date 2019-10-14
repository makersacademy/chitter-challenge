require 'pg'
require_relative '../lib/database_connection'

describe DatabaseConnection do
  describe '.setup' do
    it 'sets up connection with pg' do
      expect(PG).to receive(:connect).with(dbname: 'posts_test')

      DatabaseConnection.setup(dbname: 'posts_test')
    end
  end

  describe '.query' do
    it 'sends query to sql' do
      connection = DatabaseConnection.setup(dbname: 'posts_test')
      expect(connection).to receive(:exec).with("SELECT * FROM posts")

      DatabaseConnection.query("SELECT * FROM posts")
    end
  end
end
