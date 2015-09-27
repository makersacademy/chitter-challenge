feature 'New user sign up' do

  let(:user){build :user}

  scenario 'I can sign up as a new user' do
    expect{ sign_up(user) }.to change(User, :count).by(1)
    expect(page).to have_content "Welcome to Chitter, #{user.username}"
  end

  scenario 'password and confirmation must match' do
    user = build(:user, password_confirmation: 'wrong')
    expect{ sign_up(user) }.not_to change(User, :count)
    expect(page).to have_content "Password and confirmation password don't match"
  end

  scenario 'can\'t register with an email that\'s already taken' do
    sign_up(user)
    sign_out(user)
    user_diff = build(:user, username: 'other_name')
    expect{ sign_up(user_diff) }.not_to change(User, :count)
    expect(page).to have_content "Email already taken"
  end

  scenario 'can\'t register with a username that\'s already taken' do
    sign_up(user)
    sign_out(user)
    user_diff = build(:user, email: 'other@email.co.uk')
    expect{ sign_up(user_diff) }.not_to change(User, :count)
    expect(page).to have_content "Username already taken"
  end

  scenario 'email must be provided' do
    user = build(:user, email: '')
    expect{ sign_up(user) }.not_to change(User, :count)
    expect(page).to have_content "Email address needed"
  end

  scenario 'username must be provided' do
    user = build(:user, username: '')
    expect{ sign_up(user) }.not_to change(User, :count)
    expect(page).to have_content "Username needed"
  end

  scenario 'email must be of an email format' do
    user = build(:user, email: 'badEmail')
    expect{ sign_up(user) }.not_to change(User, :count)
    expect(page).to have_content "That doesn't seem to be a valid email"
  end

end

feature 'Existing user log in' do

  let(:user){build :user}

  before do
    create :user
  end

  scenario 'can log in with username and password' do
    log_in(user)
    expect(page).to have_content "Welcome to Chitter, #{user.username}"
  end

  scenario 'unable to log in if password incorrect' do
    user = build(:user, password: 'wrong')
    log_in(user)
    expect(current_path).to eq '/sessions/new'
    expect(page).to have_content "Username or password incorrect"
  end

  scenario 'unable to log in if username incorrect' do
    user = build(:user, username: 'other_name')
    log_in(user)
    expect(current_path).to eq '/sessions/new'
    expect(page).to have_content "Username or password incorrect"
  end

end


feature 'User can sign out' do

  let(:user){build :user}

  before do
    create :user
    log_in(user)
  end

  scenario 'user can sign out' do
    click_button 'Sign out'
    expect(page).to have_content "Goodbye"
    expect(page).not_to have_content "Welcome, #{user.username}"
  end

end
