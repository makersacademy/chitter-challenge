feature 'User Sign-up' do
	scenario 'visitors can sign up as Chitter users' do
		expect { signup }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, cooluser_123')
    expect(User.first.username).to eq('cooluser_123')
  end

  scenario 'passwords must match' do
    signup_wrong_confirmation
    expect { signup_wrong_confirmation }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Password does not match the confirmation')
  end

  scenario 'need to provide email' do
    expect { signup_blank_email }.not_to change(User, :count)
  end

  scenario 'need a valid email account to sign up' do
    expect { signup_invalid_email }.not_to change(User, :count)
  end

  scenario 'cannot use existing emails for new account' do
    signup
    expect { signup }.to_not change(User, :count)
    expect(page).to have_content('Email is already taken')
  end
end