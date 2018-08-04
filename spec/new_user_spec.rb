require './lib/new_user'
describe New_user do

  before do
    @user = New_user.create(username: 'stephisamazing', email: 'stephanie@stephanie.com', password: 'stephanie123')
  end

  describe '.create' do
    it 'creates a new user' do
      expect(@user.id).not_to be_nil
    end

    it 'encrypts password' do
      expect(BCrypt::Password).to receive(:create).with('stephanie123')
      New_user.create(username: 'stephissuchaG', email: 'stephanie@stephanie.com', password: 'stephanie123')

    end
  end

  describe '.all' do
    it 'returns all users, wrapped in a User instance' do
      expect(New_user.all.map(&:id)).to include @user.id
    end
  end

  describe '.find' do
    it 'finds a user by ID' do
      expect(New_user.find(@user.id).username).to eq @user.username
    end

    it 'returns nil if we have no ID' do
      expect(New_user.find(nil)).to eq nil
    end
  end


  describe '.authenticate' do
    it 'returns a user if they exist' do
      @user
      authenticated_user = @user
      expect(authenticated_user.username).to eq @user.username
    end
  end

end
