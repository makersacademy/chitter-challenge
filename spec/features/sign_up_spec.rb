# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter

feature 'Creating a new user account' do

  scenario 'a user can sign up to new account' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page.status_code).to eq 200
    user = User.first
    expect(user.email).to eq 'luke@lukecartledge.com'
    expect(page).to have_content 'Welcome luke!'
  end

  scenario 'a user must enter their password correctly twice to register' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(current_path).to eq '/users'
    expect(page).to have_content "Password does not match the confirmation"
  end

  scenario 'a user can not sign up without entering an email address' do
    expect{ sign_up(email: nil) }.not_to change(User, :count)
    expect(current_path).to eq '/users'
    expect(page).to have_content 'Email must not be blank'
  end

  scenario 'a user can not sign up without a valid email address' do
    expect {sign_up(email: 'invalid@email') }.not_to change(User, :count)
    expect(current_path).to eq '/users'
    expect(page).to have_content 'Email has an invalid format'
  end

  scenario 'a user can not sign up with an existing username' do
    sign_up
    expect { sign_up }.not_to change(User, :count)
    expect(page).to have_content 'Username is already taken'
  end

end
