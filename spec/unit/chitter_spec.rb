require 'chitter'
require 'database_helpers'

describe Chitter do
  let(:testuser) { User.create(email: 'test@test.com', password: 'testpassword', name: 'User') }

  describe '.all' do 
  it 'returns all chitter posts created' do
      chitter = Chitter.create(post: 'test post 1', author_id: testuser.id, author_email: testuser.email, author_name: testuser.name)
      chitter = Chitter.create(post: 'test post 2', author_id: testuser.id, author_email: testuser.email, author_name: testuser.name)
      chitter = Chitter.create(post: 'test post 3', author_id: testuser.id, author_email: testuser.email, author_name: testuser.name)

      chitters = Chitter.all

      expect(chitters[0].post).to eq('test post 1')
    end
  end

  describe '.create' do 
    it 'creates a new post' do
      chitter = Chitter.create(author_id: testuser.id, author_email: 'test@test.com', author_name: 'test', post: 'This is a test chitter post')

      expect(chitter.post).to eq 'This is a test chitter post'
    end 
  end 
end
