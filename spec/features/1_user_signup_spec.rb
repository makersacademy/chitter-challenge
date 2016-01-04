feature 'User signup' do
  scenario 'can create an account' do
    expect { user_signup }.to change{ User.count }.by(1)
    expect(page).to have_content 'Welcome, JohnnyD!'
  end
  scenario 'cannot sign up with mismatching passwords' do
    expect { user_signup(password_confirmation: 'wrong passwords') }.not_to change{ User.count }
    expect(page).to have_content 'Password does not match the confirmation'
    expect(current_path).to eq '/users'
    expect(page).to have_selector("input[value='johndoe@email.com']")
  end

  scenario 'cannot sign up with no email' do
    expect { user_signup(email: nil) }.not_to change{ User.count }
    expect(page).to have_content 'Email must not be blank'
    expect(current_path).to eq '/users'
  end

  scenario 'cannot sign up with an invalid email' do
    expect { user_signup(email: 'invalid@email' ) }.not_to change{ User.count }
    expect(page).to have_content 'Email has an invalid format'
    expect(current_path).to eq '/users'
    expect(page).to have_selector("input[value='invalid@email']")
  end

  scenario 'cannot sign up with an already registered email' do
    user_signup
    expect { user_signup }.not_to change{ User.count }
    expect(page).to have_content 'Email is already taken'
    expect(current_path).to eq '/users'
    expect(page).to have_selector("input[value='johndoe@email.com']")
  end
end
