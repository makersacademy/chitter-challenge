require 'chitter'

describe Chitter do
  
    describe '.all' do
    it 'returns all chitter posts in reverse chronological order' do
        connection = PG.connect(dbname: 'chitter_app_test')
      
        connection.exec("INSERT INTO chitter (post) VALUES ('This is my first Chitter post!');")
        connection.exec("INSERT INTO chitter (post) VALUES ('This is my second Chitter post!');")
        connection.exec("INSERT INTO chitter (post) VALUES ('This is my third Chitter post!');")

        chitter = Chitter.all

      expect(chitter).to include("This is my first Chitter post!")
      expect(chitter).to include("This is my second Chitter post!")
      expect(chitter).to include("This is my third Chitter post!")
    end
  end

  describe '.create' do 
    it 'creates a new post' do 
        Chitter.create(post: 'This is an example chitter post')

        expect(Chitter.all).to include 'This is an example chitter post'
    end 
  end 
end
