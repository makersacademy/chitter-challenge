# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter

feature 'User sign up' do

  scenario 'I can sign up as a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Logged in as Iryna')
    expect(User.first.email).to eq('iryna@mail.com')
  end

  scenario 'with a password that does not match' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content 'Password does not match the confirmation'
  end

  scenario 'I cannot sign up without an username' do
    expect { sign_up(username: nil) }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Username must not be blank')
  end

 scenario 'I cannot sign up without an email address' do
    expect { sign_up(email: nil) }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Email must not be blank')
  end

  scenario "I can't sign up with invalid email address" do
    expect { sign_up(email: "invalid@email") }.not_to change(User, :count)
  end

  scenario 'I cannot sign up with an existing email or username' do
    sign_up
    expect { sign_up }.to_not change(User, :count)
    expect(page).to have_content('Email is already taken')
    expect(page).to have_content('Username is already taken')
  end
end

# As a Maker
# So that I can post messages on Chitter as me
# I want to log in to Chitter

feature 'User log in' do

  let(:user) do
    User.create(name: 'Iryna', username: 'irisha', email: 'iryna@mail.com', password: 'chitter!', password_confirmation: 'chitter!')
  end

  scenario 'existing user with correct email/password pair can log in' do
    log_in(user.email, user.password)
    expect(page).to have_content "Logged in as #{user.name}"
  end

  scenario 'not existing user can not log in' do
    log_in('dave@dave.com', 'super')
    expect(page).not_to have_content "Welcome, Dave"
    expect(page).to have_content "The email or password is incorrect"
  end

  scenario 'existing user can not log in with incorrect password' do
    log_in('iryna@mail.com', 'super')
    expect(page).not_to have_content "Welcome, Iryna"
    expect(page).to have_content "The email or password is incorrect"
  end

  scenario 'existing user can not log in with incorrect email' do
    log_in('dave@dave.com', 'chitter!')
    expect(page).not_to have_content "Welcome, Iryna"
    expect(page).to have_content "The email or password is incorrect"
  end

end

# As a Maker
# So that I can avoid others posting messages on Chitter as me
# I want to log out of Chitter

feature 'User log out' do

  before(:each) do
    User.create(name: 'Iryna',
                username: 'irisha',
                email: 'iryna@mail.com',
                password: 'chitter!',
                password_confirmation: 'chitter!')
  end

  scenario 'when user logged in he can log out' do
    log_in('iryna@mail.com', 'chitter!')
    click_button 'Log out'
    expect(page).to have_content('Not logged in')
    expect(page).not_to have_content('Logged in as Iryna')
  end

end