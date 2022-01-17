require 'Peep'

describe 'Peep' do

  describe '.all' do
    scenario 'it returns all posted peep (messages) on Chitter' do
      connection = PG.connect(dbname: 'chitter_manager_test')
      connection.exec("INSERT INTO chitter_posts (text) VALUES ('Hello Chitter, this is my first message!');")
      connection.exec("INSERT INTO chitter_posts (text) VALUES ('Hello Chitter, this is my second message!');")
      connection.exec("INSERT INTO chitter_posts (text) VALUES ('Hello Chitter, this is my third message!');")
      
      peeps = Peep.all

      expect(peeps).to include('Hello Chitter, this is my first message!')
      expect(peeps).to include('Hello Chitter, this is my second message!')
      expect(peeps).to include('Hello Chitter, this is my third message!')
    end
  end 
end 
      

