require 'user'
require 'pg'

describe User, :user do
  let(:user) { User.new('example@hotmail.co.uk', '1234', 'Sam Worrall', 'SW22') }
  let(:example) { User.create('example@hotmail.co.uk', '1234', 'Sam Worrall', 'SW22') }

  describe '#all' do
    it 'Returns an array of User instances' do
      example
      expect(User.all).to eq [user]
    end
  end

  describe '#create' do
    it 'Returns a new instance of User' do
      expect(example).to eq user
    end
  end

  describe '#email' do
    it 'Returns the email of the user' do
      expect(example.email). to eq 'example@hotmail.co.uk'
    end
  end

  describe '#password' do
    it 'Returns the password of the user' do
      expect(example.password). to eq '1234'
    end
  end

  describe '#name' do
    it 'Returns the name of the user' do
      expect(example.name). to eq 'Sam Worrall'
    end
  end

  describe '#username' do
    it 'Returns the username of the user' do
      expect(example.username). to eq 'SW22'
    end
  end
end
