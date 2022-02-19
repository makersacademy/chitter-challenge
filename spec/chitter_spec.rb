require 'chitter'

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
      Chitter.post(peep: 'example')
      
      expect(Chitter.post).to include 'example peep'
    end
  end
end

