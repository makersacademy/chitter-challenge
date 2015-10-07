feature 'Sign up' do

  let(:user) { build(:user) }

  scenario 'User can sign up as a new user' do
    expect { sign_up(user) }.to change(User, :count).by(1)
    expect(page).to have_content("Welcome, #{user.name}")
    expect(page).to have_content("Successfully signed up")
    expect(User.first.email).to eq user.email
    expect(User.first.name).to eq user.name
    expect(User.first.nickname).to eq user.nickname
  end

  scenario 'User cannot sign up without an email' do
    user = build(:user, email: '')
    expect { sign_up(user) }.not_to change(User, :count)
  end

  scenario 'User cannot sign up without a name' do
    user = build(:user, name: '')
    expect { sign_up(user) }.not_to change(User, :count)
  end

  scenario 'User cannot sign up without a nickname' do
    user = build(:user, nickname: '')
    expect { sign_up(user) }.not_to change(User, :count)
  end

  scenario 'User cannot sign up when password and confirmation do not match' do
    user = build(:user, password: '1234')
    expect { sign_up(user) }.not_to change(User, :count)
  end

  scenario 'Hashed password with salt is stored in the database' do
    sign_up(user)
    expect(user.password).not_to eq(user.password_digest)
  end

  scenario 'User cannot sign up again with the same email address/nickname' do
    sign_up(user)
    expect { sign_up(user) }.not_to change(User, :count)
  end
end
