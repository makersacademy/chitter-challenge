require 'DBTools'

describe '.all' do 
  it 'returns a chit' do 
    conn = PG.connect( dbname: 'chitter_test' )
    conn.exec("INSERT INTO messages(user_name, message) VALUES ('andy', 'hi i am andy')")
    
    chits = DBTools.all
    expect(chits).to include("andy")
    expect(chits).to include("hi i am andy")
  end 
end