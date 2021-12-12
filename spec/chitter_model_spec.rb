require 'pg'

describe Chitter_Model do 
  describe '.all' do
    it 'returns all chitts' do

      connection = PG.connect(dbname: 'chitter_test')

      connection.exec("INSERT INTO chitts (username, chitt, created_on) VALUES ('Tim','I have chitter now!','2021-12-11 16:48:09 ');")
      connection.exec("INSERT INTO chitts (username, chitt, created_on) VALUES ('Timothy','I just made a new chitter, got hacked!','2021-12-11 16:48:09 ');")
      connection.exec("INSERT INTO chitts (username, chitt, created_on) VALUES ('NotTim','I forgot my bank details - can someone help?','2021-12-11 16:48:09 ');")

      chitt = Chitter_Model.all

      expect(chitt).to include("Tim - I have chitter now! - 2021-12-11 16:48:09")
      expect(chitt).to include("Timothy - I just made a new chitter, got hacked! - 2021-12-11 16:48:09")
      expect(chitt).to include("NotTim - I forgot my bank details - can someone help? - 2021-12-11 16:48:09")
    end
  end

  describe '.create' do
    it 'creates a new bookmark' do
      Chitter_Model.create(username: 'Sonic', chitt: 'Gotta go fast!', time: '2021-12-11 16:48:09 ')

      expect(Chitter_Model.all).to include 'Sonic - Gotta go fast! - 2021-12-11 16:48:09'
    end
  end
end
