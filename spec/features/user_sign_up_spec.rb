feature 'User sign up' do
  scenario 'User can sign up for Chitter' do
    expect { sign_up }.to change(User, :count).by 1
    expect(User.first.name).to eq 'Matt'
    expect(User.first.username).to eq 'iammatthewward'
    expect(User.first.email).to eq 'matt@email.com'
  end

  scenario 'User password is saved securely' do
    sign_up
    expect(User.first.password_digest).not_to eq 'password'
  end

  scenario 'User cannot sign up with a registered email' do
    sign_up
    expect { sign_up }.not_to change(User, :count)
  end

  scenario 'Both password input must match' do
    expect { sign_up('incorrect') }.not_to change(User, :count)
  end

  scenario 'Sign up fails if passwords mismatch' do
    sign_up('incorrect')
    expect(current_path).to eq '/sign-up'
    expect(page).to have_content 'Passwords did not match'
  end
end
