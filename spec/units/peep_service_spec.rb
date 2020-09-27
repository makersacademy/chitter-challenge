require 'peep_service'

describe PeepService do
  let(:message) { 'This is my peep message' }
  let(:username) { 'testUser' }
  let(:name) { 'Testing' }
  let(:email) { 'test@example.com' }
  let(:password) { 's3curePa$$word' }

  describe '.post(message, author)' do
    it 'stores the given peep message and author user id' do
      UserService.register(username, name, email, password)
      PeepService.post(message, username)

      expect(PeepService.all[0].message).to eq message
      expect(PeepService.all[0].username).to eq username
    end

    it 'stores the post creation time' do
      UserService.register(username, name, email, password)
      PeepService.post(message, username)

      expect(PeepService.all[0].created_at).to be_an_instance_of(DateTime)
    end
  end
end