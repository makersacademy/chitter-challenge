feature 'User sign up' do
  scenario 'User can sign up to Sh*tter' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content("Welcome ")
    expect(User.first.email).to eq('tommy@test.com')
  end

  scenario 'requires a matching confirmation password' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
  end

  scenario 'with a password that does not match' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content 'Password does not match the confirmation'
  end

  scenario "I can't sign up without an email address" do
    expect { sign_up(email: nil) }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Email must not be blank')
  end

  scenario "I can't sign up with an invalid email address" do
    expect { sign_up(email: "invalid@email") }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Email has an invalid format')
  end

  scenario 'I cannot sign up with an existing email' do
    sign_up
    expect { sign_up }.to_not change(User, :count)
    expect(page).to have_content('Email is already taken')
  end

end

feature 'user sign in' do
  let!(:user) do
    User.create(email: 'tommy@testy.com', username: 'tommytest', password: 'qwerty', password_confirmation: 'qwerty')
  end

  scenario 'user signs in with correct details' do
    sign_in(email: user.email, password: user.password)
    expect(page).to have_content("Welcome, tommytest")
  end

  it 'authenticates when given a valid email address and password' do
    authenticated_user = User.authenticate(user.email, user.password)
    expect(authenticated_user).to eq user
  end

  it 'does not authenticate when given an incorrect password' do
    expect(User.authenticate(user.email, 'wrong_password')).to be_nil
  end
end

feature 'User signs out' do

  before(:each) do
    User.create(email: 'tommy@testy.com', username: 'tommytest',
                password: 'qwerty',
                password_confirmation: 'qwerty')
  end

  scenario 'sign out from sign in' do
    sign_in(email: 'tommy@testy.com', password: 'qwerty')
    click_button 'Sign Out'
    expect(page).to have_content('Goodbye!')
    expect(page).not_to have_content('Welcome, tommy@testy.com')
  end

end
