describe User do

  email = "bob@gmail.com"
  name = "Bob Smith"
  handle = "Bob"
  bio = "Hi, I'm Bob"
  password = "password"
  password_wrong = "password123"
  email_wrong = 'johnsmith&gmail.com'

  describe "Authenticating a user" do

    let!(:user) do
        User.create(email: email, name: name,
                    password: password, handle: handle,
                    bio: bio, password_confirmation: password)
    end

    it 'authenticates when given a valid email address and password' do
      authenticated_user = User.authenticate(user.email, user.password)
      expect(authenticated_user).to eq user
    end

    it 'does not authenticate when given an incorrect password' do
      expect(User.authenticate(user.email, password_wrong)).to be_nil
    end

    it 'does not authenticate when given an incorrect email' do
      expect(User.authenticate(email_wrong, password)).to be_nil
    end

  end

  describe "Creating a user" do

    it 'requires a handle that is not blank' do
      expect{ User.create(email: email, name: name, password: password,
                         handle: "", bio: bio, password_confirmation: password)}.not_to change(User, :count)
    end

    it 'requires a name that is not blank' do
      expect{ User.create(email: email, name: '', password: password,
                         handle: handle, bio: bio, password_confirmation: password)}.not_to change(User, :count)
    end

    it 'requries matching passwords' do
      expect { User.create(email: email, name: name, password: password,
                          handle: handle, bio: bio, password_confirmation: password_wrong)}.not_to change(User, :count)
    end

    it 'requries an email address' do
      expect{ User.create(email: nil, name: name, password: password,
                         handle: handle, bio: bio, password_confirmation: password)}.not_to change(User, :count)
    end

     it 'requires an email in the valid format' do
       expect{User.create(email: email_wrong, name: name, password: password,
                          handle: handle, bio: bio, password_confirmation: password)}.not_to change(User, :count)
    end

    it 'requires an email address that does not exist in the database' do
      User.create(email: email, name: name, password: password,
                  handle: handle, bio: bio, password_confirmation: password)

      expect{User.create(email: email, name: name, password: password,
                                 handle: handle, bio: bio, password_confirmation: password)}.not_to change(User, :count)
    end

  end

end
