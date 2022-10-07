require 'chitter'
require 'pg'

 describe Chitter do
  describe '.timeline' do
    it 'shows the timeline' do
      connection = PG.connect(dbname: 'chitter_test')
      
      connection.exec("INSERT INTO post (peep, date_posted) VALUES ('hello world', current_timestamp);")
      connection.exec("INSERT INTO post (peep, date_posted) VALUES ('this is your timeline', current_timestamp);")
      connection.exec("INSERT INTO post (peep, date_posted) VALUES ('peeps from other users are here', current_timestamp);")

      chitter = Chitter.timeline

      expect(chitter).to include('hello world')
      expect(chitter).to include('this is your timeline')
      expect(chitter).to include('peeps from other users are here')
    end 
  end
  describe '.post' do
    it 'publishes a post' do
      Chitter.post(peep: 'example peep')
      
      expect(Chitter.timeline).to include 'example peep'
    end
  end

  describe '.signup' do
    it 'lets a user sign up and create an account' do
      Chitter.signup(name: 'Camilla Greene', username: 'cgreene', emailaddress: 'cgreene@mail.com', password: 'password')

      expect(Chitter.post).to include "Welcome '#{username}"
    end
  end
end

