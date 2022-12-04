require 'message_repository'

describe Message do
  def reset_books_table
    seed_sql = File.read('spec/seeds.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
    connection.exec(seed_sql)
  end

  before(:each) do 
    reset_books_table
  end
  
  context "all" do
    it "returns all messages" do
    
    end
  end
end