require 'user'

describe User do
  subject(:user) { described_class.new }

  describe '#find' do
    it 'finds a user based on their email' do
      expect(User.find("tom@hotmail.com")).to_not be_nil
    end
  end

  describe '#all' do
    it 'returns list of all users within database' do
      expect(User.all.find { |user| user.email == "tom@hotmail.com" }).to_not be_nil
      expect(User.all.find { |user| user.email == "george@gmail.com" }).to_not be_nil
      expect(User.all.find { |user| user.email == "kevin@btinternet.com" }).to_not be_nil
    end
  end

  describe '#create' do
    it 'new user' do
      User.create('peter@gmail.com', 'peter')
      expect(User.find('peter@gmail.com')).to_not be_nil
    end
  end

  describe '#post' do
    it 'posts a new peep' do
      user = User.find('tom@hotmail.com')
      user.post('My first peep')
      expect(Peep.all.find { |peep| peep.text == "My first peep" }).to_not be_nil
    end
  end
end

