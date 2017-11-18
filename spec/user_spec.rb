require './app/models/user'
require 'bcrypt'

def get_user
  User.create(
    password: 'a', 
    password_confirmation: 'a',
    name: 'name',
    email: 'name@domain.com',
    handle: 'handle'
  )
end

describe User do
  subject do
    described_class.create(
      password: 'a', 
      password_confirmation: 'a',
      name: 'name',
      email: 'name@domain.com',
      handle: 'handle'
    )
  end

  describe '#password' do
    context 'when creating digest attribute' do
      after(:each) do 
        described_class.new(password: 'a', password_confirmation: 'a')
      end

      it 'encrypts password' do
        expect(BCrypt::Password).to receive(:create).with('a')
      end 
    end

    context 'after password encryption' do
      it 'sets @password' do
        expect(subject.password).to eq 'a'
      end
    end
  end

  describe '#authenticate' do
    context 'when has valid credentials' do
      it 'returns user object' do
        user = get_user
        expect(User.authenticate('name@domain.com', 'a')).to eq user
      end
    end

    context 'when has invalid credentials' do
      it 'returns nil' do
        user = get_user
        expect(User.authenticate('name@nowhere.com', 'a')).to eq nil
      end

      it 'returns nil' do
        user = get_user
        expect(User.authenticate('name@domain.com', 'b')).to eq nil
      end
    end
  end
end
