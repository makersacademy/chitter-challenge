require 'db_connection'
	
	describe DbConnection do 
	  it "can connect to database" do
	    expect(PG).to receive(:connect).with(dbname: 'chitter_chatter_test')
	    DbConnection.setup("chitter_chatter_test")
	  end
	
	  it "can has a connection to database" do
	    conn = DbConnection.setup("chitter_chatter_test")
	    expect(DbConnection.connection).to eq(conn)
	  end
	  it "can execute a SQL query" do
	    DbConnection.setup("chitter_chatter_test")
	    expect(DbConnection.connection).to receive(:exec).with("SELECT * FROM peeps;")
	    DbConnection.query("SELECT * FROM peeps;")
	
	  end
  end 
  