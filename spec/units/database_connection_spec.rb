require 'database_connection'

describe DatabaseConnection do

  let(:subject) { DatabaseConnection}
  
  describe "#setup" do
    it "takes a database and connects" do
      expect(subject.setup('chitter_test')).is_a?(PG)
    end

    it 'sets up a connection to a database through PG' do
      expect(PG).to receive(:connect).with(dbname: 'chitter_test')

      subject.setup('chitter_test')
    end

    it "is the same connection" do
      connection = DatabaseConnection.setup('bookmark_manager_test')

      expect(DatabaseConnection.connection).to eq connection
    end
  end

  describe "#query" do
    it 'passes an sql string to the connection' do
      expect(subject.setup('bookmark_manager_test')).to receive(:exec).with("INSERT INTO bookmarks(title, url) VALUES ('Google' ,'http://www.google.com')")
      subject.query("INSERT INTO bookmarks(title, url) VALUES ('Google' ,'http://www.google.com')")
    end
  end

end