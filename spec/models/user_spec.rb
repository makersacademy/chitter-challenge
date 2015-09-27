require './app/models/user_model'

describe Chatter::Models::User do

  it 'Can add user with correct input to database' do
    user = build(:user)
    expect { add_user(user) }.to change(User, :count).by(1)
  end

  it 'Does not add user with incorrect input to database' do
    user = build(:user, email:"")
    expect { add_user(user) }.to change(User, :count).by(0)
  end

  it 'Can force email true' do
    user = build(:user, email: "")
    expect(add_user(user).errors.full_messages).to include("Email is required.")
  end

  it 'Can force email address to be correct format' do
    user = build(:user, email: "waef")
    expect(add_user(user).errors.full_messages).to include("Please enter a valid email address")
  end

  it 'Can force email unique' do
    user = build(:user)
    add_user(user)
    expect(add_user(user).errors.full_messages).to include("Email address is taken")
  end

  it 'Can force name true' do
    user = build(:user, real_name: "")
    expect(add_user(user).errors.full_messages).to include("Name is required.")
  end

  it 'Can force username true' do
    user = build(:user, user_name: "")
    expect(add_user(user).errors.full_messages).to include("Username is required.")
  end

  it 'can force username unique' do
    user = build(:user)
    add_user(user)
    expect(add_user(user).errors.full_messages).to include("Username is taken")
  end

  it 'Can not add user with incorrect passwords' do
    user = build(:user, password: "ewfa")
    expect(add_user(user).errors.full_messages).to include("Passwords do not match.")
  end

  it 'Does not allow password to be blank' do
    user = build(:user, password: "")
    expect(add_user(user).errors.full_messages).to include("Password cannot be blank")
  end

  it 'returns truthy if authenticating valid user with username' do
    user = build(:user)
    add_user(user)
    expect(User.authenticate(user.user_name, user.password)).to be_truthy
  end

  it 'returns truthy if authenticating valid user with email address' do
    user = build(:user)
    add_user(user)
    expect(User.authenticate(user.email, user.password)).to be_truthy
  end

  it 'returns falsey if user does not enter valid password' do
    user = build(:user)
    add_user(user)
    expect(User.authenticate(user.user_name, 'wrong')).to be_falsey
  end

  it 'returns falsey if user does not enter valid user or email' do
    user = build(:user)
    add_user(user)
    expect(User.authenticate('wrong_user', user.password)).to be_falsey
  end

end
