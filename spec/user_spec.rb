require 'user'

describe User do
  it { should have_property :email }
  it { should have_property :password }
  it { should have_property :name }
  it { should have_property :username }

  describe '#self.sign_up' do
    it 'signs up user and store info in database' do
      email = 'jamesbrown@funk.com'
      password = 'mother_popcorn_123'
      name = 'James Brown'
      username = 'godfatherOfFunk'
      new_user = User.sign_up(email, password, name, username)
      expect(User.all).to include new_user
    end
  end
end
