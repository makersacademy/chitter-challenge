feature 'Sign up' do

  let(:user) { build(:user) }

  scenario 'I can sign up as a new user' do
    expect { sign_up(user) }.to change(User, :count).by(1)
    expect(page).to have_content("Welcome, #{user.name}")
    expect(User.first.email).to eq user.email
    expect(User.first.name).to eq user.name
    expect(User.first.nickname).to eq user.nickname
  end

  scenario 'I cannot sign up without an email' do
    user = build(:user, email: '')
    expect { sign_up(user) }.not_to change(User, :count)
  end

  scenario 'I cannot sign up without a name' do
    user = build(:user, name: '')
    expect { sign_up(user) }.not_to change(User, :count)
  end

  scenario 'I cannot sign up without a nickname' do
    user = build(:user, nickname: '')
    expect { sign_up(user) }.not_to change(User, :count)
  end

  scenario 'I cannot sign up when password and confirmation do not match' do
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


  def sign_up(user)
    visit '/users/new'
    fill_in 'email', with: user.email
    fill_in 'name', with: user.name
    fill_in 'nickname', with: user.nickname
    fill_in 'password', with: user.password
    fill_in 'password_confirmation', with: user.password_confirmation
    click_button 'Sign up'
  end
end
