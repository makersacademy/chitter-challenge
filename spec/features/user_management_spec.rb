feature 'User sign up' do

  let(:user){ build :user }

  def sign_up(user)
    visit '/users/new'
    expect(page.status_code).to eq(200)
    fill_in :email, with: user.email
    fill_in :handle, with: user.handle
    fill_in :password, with: user.password
    fill_in :password_confirmation, with: user.password_confirmation
    click_button 'Sign up'
  end

  scenario 'I can sign up as a new user' do
    expect { sign_up(user) }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, chweeks')
    expect(User.first.email).to eq('chris@example.com')
  end

  scenario 'requires a matching confirmation password' do
    user = build(:user, password_confirmation: 'wrong')
    expect {sign_up(user)}.not_to change(User,:count)
  end

  scenario 'with a password that does not match' do
    user = build(:user, password_confirmation: 'wrong')
    expect {sign_up(user)}.not_to change(User,:count)
    expect(current_path).to eq('/users')
    expect(page).to have_content 'Password does not match the confirmation'
  end

  scenario 'I cannot sign up with an existing email' do
    sign_up(user)
    expect { sign_up(user) }.to change(User, :count).by(0)
    expect(page).to have_content('Email is already taken')
  end

  scenario 'I cannot sign up with an existing peep handle' do
    sign_up(user)
    user = build(:user, handle: 'chweeks')
    expect { sign_up(user) }.to change(User, :count).by(0)
    expect(page).to have_content('Handle is already taken')
  end

end

feature 'User sign in' do

  def sign_in(handle:, password:)
    visit 'sessions/new'
    fill_in :handle, with: user.handle
    fill_in :password, with: user.password
    click_button 'Sign In'
  end

  let(:user){ create :user }

  scenario 'with correct credentials' do
    sign_in(handle: user.handle, password: user.password)
    expect(page).to have_content "Welcome, #{user.handle}"
  end

  it 'does not authenticate when given an incorrect password' do
    expect(User.authenticate(user.handle, 'wrong_stupid_password')).to be_nil
  end

end
