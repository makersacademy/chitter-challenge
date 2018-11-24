describe DatabaseConnection do
  describe '.setup' do
    it 'sets up a connection to the datbase using PG' do
      expect(PG).to receive(:connect).with(dbname: 'chitter_test')
      DatabaseConnection.setup('chitter_test')
    end
  end
end


# describe DatabaseConnection do
#
#   describe '.setup' do
#     it 'sets up a connection to the database through PG' do
#       expect(PG).to receive(:connect).with(dbname: 'bookmark_manager_test')
#
#       DatabaseConnection.setup('bookmark_manager_test')
#     end
#   end
#
#   describe '.query' do
#     it 'executes SQL queries via PG' do
#       connection = DatabaseConnection.setup('bookmark_manager_test')
#
#       expect(connection).to receive(:exec).with("SELECT * FROM bookmarks;")
#
#       DatabaseConnection.query("SELECT * FROM bookmarks;")
#     end
#   end

# end
