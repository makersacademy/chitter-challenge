feature 'Signing up successfully' do
  scenario 'Successful signing up with valid credentials' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(current_path).to eq('/peeps')
  end
end

feature 'Signing up errors with username' do
  scenario 'Missing username' do
    expect { sign_up(username: '') }.to change(User, :count).by(0)
    expect(current_path).to eq('/users/new')
    expect(page).to have_content('Please enter a username')
  end

  scenario 'Username already in use' do
    sign_up
    expect { sign_up(email: 'other@email.com') }.to change(User, :count).by(0)
    expect(current_path).to eq('/users/new')
    expect(page).to have_content('Username already in use')
  end
end

feature 'Signing up errors with email' do
  scenario 'Missing email' do
    expect { sign_up(email: '') }.to change(User, :count).by(0)
    expect(current_path).to eq('/users/new')
    expect(page).to have_content('Please enter an email address')
  end

  scenario 'Email already registered' do
    sign_up
    expect { sign_up(username: 'other') }.to change(User, :count).by(0)
    expect(current_path).to eq('/users/new')
    expect(page).to have_content('Email already registered')
  end

  scenario 'Invalid format for email address' do
    expect { sign_up(email: 'invalidemail') }.to change(User, :count).by(0)
    expect(current_path).to eq('/users/new')
    expect(page).to have_content('Email has an invalid format')
  end
end

feature 'Signing up errors with password' do
  scenario 'Password confirmation mismatch' do
    expect { sign_up(password: 'match', password_confirmation: 'mismatch') }.
      to change(User, :count).by(0)
    expect(current_path).to eq('/users/new')
    expect(page).to have_content('Password does not match the confirmation')
  end
end
