require "database" 

describe DataBase do 
  describe "#connect" do 
    it "connect to the required database" do
      expect(PG).to receive(:connect).with(dbname: 'chitter_test')

      DataBase.connect("chitter_test")
    end
  end

  describe "current_connection" do 
    it "return the current connection to the database" do 
      connection = DataBase.connect("chitter_test")

      expect(DataBase.current_connection).to eq connection
    end
  end

  describe "#query" do 
    it "Execute query via PG" do 
      connection = DataBase.connect('chitter_test')

      expect(connection).to receive(:exec).with("SELECT * FROM posts;")

      DataBase.query("SELECT * FROM posts;")
    end
  end

end