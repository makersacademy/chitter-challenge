require 'user_repo'

describe UserRepo do
  before(:each) do 
    reset_tables
  end

  context 'when using the method .all' do
    it 'returns an array of all the users' do
      repo = UserRepo.new
      result = repo.all
      expect(result.length).to eq 1
      expect(result[0].id).to eq '1'
      expect(result[0].email_address).to eq 'shrek@swamp.com'
      expect(result[0].username).to eq 'fionalover420'
      expect(result[0].name).to eq 'Shrek'
      expect(result[0].password).to eq 'I_Love_Fiona_69'
    end
  end

  context 'when using the method .create' do 
    it 'creates a user' do
      repo = UserRepo.new
      new_user = User.new
      new_user.email_address = 'fiona@swamp.com'
      new_user.username = 'singlemominyourarea'
      new_user.name = 'Fiona'
      new_user.password = 'newlysingle420blazed'
      repo.create(new_user)
      expect(repo.all).to include(
        have_attributes(
          email_address: new_user.email_address,
          username: new_user.username,
          name: new_user.name,
          password: new_user.password
        )
      )
    end
    
    it 'doesnt add a new user if the email address is already taken' do
      repo = UserRepo.new
      new_user = User.new
      new_user.email_address = 'shrek@swamp.com'
      new_user.username = 'singlefatherinyourarea'
      new_user.name = 'Not Shrek'
      new_user.password = 'pleasecomebackfiona21'
      repo.create(new_user)
      expect(repo.all.length).to eq 1
    end

    it 'doesnt add a new user if the username is already taken' do
      repo = UserRepo.new
      new_user = User.new
      new_user.email_address = 'shrek2@swamp.com'
      new_user.username = 'fionalover420'
      new_user.name = 'Not Shrek'
      new_user.password = 'pleasecomebackfiona21'
      repo.create(new_user)
      expect(repo.all.length).to eq 1
    end
  end

  context 'when using the method .find_by_username' do
    it 'returns the user information on the username given' do
      repo = UserRepo.new
      result = repo.find_by_username('fionalover420')
      expect(result.id).to eq '1'
      expect(result.email_address).to eq 'shrek@swamp.com'
      expect(result.username).to eq 'fionalover420'
      expect(result.name).to eq 'Shrek'
      expect(result.password).to eq 'I_Love_Fiona_69'
    end
  end
end
