require 'user'


describe '.create' do
    it 'hash password using BCrypt' do
        expect(BCrypt::Password).to receive(:create).with('password123')
        User.create(username: 'myname', email: 'test@example.com', password: 'password123')
  end
end


describe '.read' do
    it 'returns all users, wrapped in a User instance' do
        user = User.create(username: 'myname', email: 'test@example.com', password: 'password123')
        expect(User.read.map(&:id)).to include user.id
    end
end


describe '.find' do
    it 'find a user by id' do
        user = User.create(username: 'myname', email: 'test@example.com', password: 'password123')
        expect(User.find(user.id).email).to eq(user.email)
    end
    

    it 'returns nil if there is no id given' do
        expect(User.find(nil)).to eq nil
    end
end