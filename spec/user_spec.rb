require 'user'

describe 'User' do
  user = User.create(
    username: 'christos',
    email: 'christos@makers.com',
    password: 'classicWoW')

  context '#create' do
    it 'can be created' do
      user = User.create(
        username: 'christos',
        email: 'christos@makers.com',
        password: 'classicWoW')
    end
  end

  context '#username' do
    it "displays User's username" do
      expect(user.username).to eq('christos')
    end
  end

  context '#authenticate' do
    let!(:user) { User.create(
      username: 'christos',
      email: 'christos@makers.com',
      password: 'classicWoW')
    }
    it "Sign in if username and password are correct" do
      expect(User.authenticate('christos', 'classicWoW')).to eq(user)
    end
  end

  context '#valid?' do
    it 'confirms uniqueness of unused email on signup' do
      expect(user.valid?).to eq true
    end

    it 'Returns false if email of existing user used on signup' do
      user_one = User.create(username: 'Christos', email: 'christos@maker.com', password: 'ClassicWoW')
      user_two = User.create(username: 'Christos', email: 'christos@maker.com', password: 'ClassicWoW')
      expect(user_two.valid?).to eq false
    end
  end

end
