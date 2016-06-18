feature 'User signs up' do
  scenario 'as a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, somealex')
    expect(User.first.name).to eq('alex')
    expect(User.first.user_name).to eq('somealex')
    expect(User.first.email).to eq('alex@example.com')
  end

  scenario 'with a password that does not match' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content 'Password does not match the confirmation'
  end

  scenario 'without a name' do
    expect { sign_up(name: nil) }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Name must not be blank')
  end

  scenario 'without a user name' do
    expect { sign_up(user_name: nil) }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('User name must not be blank')
  end

  scenario 'without an email address' do
    expect { sign_up(email: nil) }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Email must not be blank')
  end

  scenario 'with an invalid email address' do
    expect { sign_up(email: "invalid@email") }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Email has an invalid format')
  end

  scenario 'with an existing email' do
    expect{ sign_up }.to change(User, :count).by(1)
    expect{ sign_up }.not_to change(User, :count)
    expect(page).to have_content 'Email is already taken'
  end

  scenario 'with an existing user name' do
    expect{ sign_up }.to change(User, :count).by(1)
    expect{ sign_up }.not_to change(User, :count)
    expect(page).to have_content 'User name is already taken'
  end
end
