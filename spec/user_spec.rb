require 'user.rb'

describe 'User' do
  describe '.create' do
    it 'creates a new user' do
      User.create(email: 'raefe.nj@gmail.com', name: 'Raefe', username: 'Raefe01', password: "password123")
      expect(User.all[0]).to have_attributes(id: '1', email: 'raefe.nj@gmail.com', username: 'Raefe01', password: 'password123')
    end
  end
end
