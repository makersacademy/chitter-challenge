feature 'User sign up' do
  scenario 'User can sign up for Chitter' do
    expect { sign_up }.to change(User, :count).by 1
    expect(User.first.name).to eq 'Matt'
    expect(User.first.username).to eq 'user1'
    expect(User.first.email).to eq 'user@email.com'
  end

  scenario 'User password is saved securely' do
    sign_up
    expect(User.first.password_digest).not_to eq 'password'
  end

  scenario 'Sign up fails if email taken' do
    sign_up('user','user@email.com', 'password')
    expect { sign_up }.not_to change(User, :count)
    expect(page).to have_content 'An account already exists with that email'
  end

  scenario 'Sign up fails if username taken' do
    sign_up
    expect { sign_up('user1','new@email.com', 'password') }.not_to change(User, :count)
    expect(page).to have_content 'An account already exists with that username'

  end

  scenario 'Sign up fails if passwords mismatch' do
    expect { sign_up('user', 'email@email.com', 'incorrect') }.not_to change(User, :count)
    expect(current_path).to eq '/sign-up'
    expect(page).to have_content 'Passwords did not match'
  end

end
