feature 'user_signup' do
  scenario 'User successfully signs up with username, email and password' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content("Welcome user1!")
  end

  scenario 'No user is created when passwords dont match' do
    expect { sign_up(password_confirmation: 'wrong') }.to_not change(User, :count)
    expect(current_path).to eq '/users'
    expect(page).to have_content('Password does not match the confirmation')
  end

  scenario 'User cannot sign up without email address' do
    expect { sign_up(email: nil) }.to_not change(User, :count)
    expect(current_path).to eq '/users'
    expect(page).to have_content('Email must not be blank')
  end

  scenario 'User cannot sign up with an invalid email' do
    expect { sign_up(email: 'user@email') }.to_not change(User, :count)
    expect(current_path).to eq '/users'
    expect(page).to have_content('Email has an invalid format')
  end

  scenario 'User cannot sign up with a taken email address' do
    sign_up
    expect { sign_up(username: 'user2') }.to_not change(User, :count)
    expect(current_path).to eq '/users'
    expect(page).to have_content('Email is already taken')
  end

  scenario 'User cannot sign up with a taken username' do
    sign_up
    expect { sign_up(email: 'user2@email.com') }.to_not change(User, :count)
    expect(current_path).to eq '/users'
    expect(page).to have_content('Username is already taken')
  end
end
