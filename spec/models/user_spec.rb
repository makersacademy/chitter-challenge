describe User do

  subject(:user)    { described_class }
  let(:full_name)   { "Ryan"          }
  let(:email)       { 'ryan@ryan.com' }
  let(:username)    { 'ryan'          }
  let(:password)    { 'password'      }
  let(:password2)   { 'password2'     }
  let(:full_name2)  { "Ryan2"         }
  let(:email2)      { 'ryan@ryan.com' }
  let(:username2)   { 'ryan'          }

  let(:test_user) do
    user.create(full_name: full_name,
                email: email,
                username: username,
                password: password,
                password_confirmation: password)
  end

describe '#authenticate' do

  context 'a user with a valid email and password' do
    it "returns a user" do
      expect(User.authenticate(email, password)).to be_a user
    end
  end

  it 'should not authenticate a user with an invalid email' do
    authenticated_user = User.authenticate(email2, password)
    expect(authenticated_user).not_to eq eq User.get(email: email)
  end

  it 'should not authenticate a user with an invalid password' do
    authenticated_user = User.authenticate(email, password2)
    expect(authenticated_user).not_to eq eq User.get(email: email)
  end

end

describe 'creating a user' do
  context 'scenarios' do

    it 'should initialise with a full name' do
      expect(test_user.full_name).to eq full_name
    end

  end
    it 'should initialise with a full name' do
      expect(test_user.full_name).to eq full_name
    end

    it 'should initialise with a username' do
      expect(test_user.username).to eq username
    end

    it 'should initialise with a email' do
      expect(test_user.email).to eq email
    end

    context 'validations' do
      context 'email present' do
        it "throws error"
      end
      context 'email absent' do
        it "raises count by 1" do

        end
      end
    end

    it 'should require a email that is not blank' do
      expect{ user.create(full_name: full_name2,
      email: "", username: username2,
      password: password2, password_confirmation: password2) }.not_to change(User, :count)
    end

    it 'should require a username that is not blank' do
      expect{ user.create(full_name: full_name2,
      email: email, username: "",
      password: password2, password_confirmation: password2) }.not_to change(User, :count)
    end

    it 'should require a full_name that is not blank' do
      expect{ user.create(full_name: "",
      email: email, username: username2,
      password: password2, password_confirmation: password2) }.not_to change(User, :count)
    end

    it 'should require a password that is not blank' do
      expect{ user.create(full_name: full_name2,
      email: email, username: username2,
      password: "", password_confirmation: "") }.not_to change(User, :count)
    end

    it 'should have an unique email' do
      user.create(full_name: full_name,
      email: email, username: username,
      password: password, password_confirmation: password)
      expect{ user.create(full_name: full_name2,
      email: email, username: username2,
      password: password2, password_confirmation: password2) }.not_to change(User, :count)
    end

    it 'should have a unique username' do
      user.create(full_name: full_name,
      email: email, username: username,
      password: password, password_confirmation: password)
      expect{ user.create(full_name: full_name2,
      email: email2, username: username,
      password: password2, password_confirmation: password2) }.not_to change(User, :count)
    end

    it 'requires matching password and password_confirmation' do
      expect{ user.create(full_name: full_name2,
      email: email2, username: username2,
      password: password, password_confirmation: password2) }.not_to change(User, :count)
    end

  end
end
