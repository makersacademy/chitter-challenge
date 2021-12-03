require 'chitter'

describe Chitter do
  
  describe '.all' do
      
  it 'returns all chitter posts created' do
      connection = PG.connect(dbname: 'chitter_app_test')
      connection.exec("INSERT INTO chitter (id, post, time) VALUES (1, 'This is my FIRST chitter post', '2021-01-01 00:00:00+00');")
      # connection.exec("INSERT INTO chitter (id, post, time) VALUES (2, 'This is my SECOND chitter post', '2022-01-01 00:00:00+00');")
      chitters = Chitter.all

      # expect(chitters.length).to eq(2)
      expect(chitters[0].post).to eq("This is my FIRST chitter post")
      # expect(chitters[1].post).to eq("This is my SECOND chitter post")
    end
  end

  describe '.create' do 
    it 'creates a new post' do 
      chitter = Chitter.create(post: 'This is my FIRST chitter post')

      # persisted_data = persisted_data(id: chitter.id)

      expect(chitter.post).to eq 'This is my FIRST chitter post'
    end 
  end 
end
