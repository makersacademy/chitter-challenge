require 'user'

describe User do
  describe ".create" do
    it 'creates a new user and returns user instance' do
      user = User.create('as13380', 'as13380@gmail.com', 'secretpassword1', 'Alex Smith')

      expect(user.full_name).to eq 'Alex Smith'
      expect(user.username).to eq 'as13380'
      expect(user.email).to eq 'as13380@gmail.com'
      expect(user.password).to eq 'secretpassword1'
    end
  end

  describe ".all" do
    it 'returns a list of users' do
      User.create('as13380', 'as13380@gmail.com', 'secretpassword1', 'Alex Smith')
      User.create('jd16380', 'jd16380@gmail.com', 'secretpassword2', 'John Doe')

      expect(described_class.all.last.full_name).to eq 'John Doe'
      expect(described_class.all.last.username).to eq 'jd16380'
      expect(described_class.all.last.email).to eq 'jd16380@gmail.com'
      expect(described_class.all.last.password).to eq 'secretpassword2'
    end
  end

  describe ".find" do
    it 'returns the user corresponding to a given user id' do
      user = User.create('as13380', 'as13380@gmail.com', 'secretpassword1', 'Alex Smith')

      expect(described_class.find(user.id).id).to eq user.id
      expect(described_class.find(user.id).full_name).to eq user.full_name
      expect(described_class.find(user.id).username).to eq user.username
      expect(described_class.find(user.id).email).to eq user.email
      expect(described_class.find(user.id).password).to eq user.password
    end
  end
end
