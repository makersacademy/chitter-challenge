feature 'User Sign Up' do
  scenario 'a user can sign up to chitter' do
    expect { sign_up }.to change { User.count }.by 1
    expect(current_path).to eq '/peeps'
    expect(page).to have_content 'Welcome, Test User'
  end

  scenario 'a user\'s email must be formatted correctly' do
    expect { sign_up(email: 'failures') }.not_to change { User.count }
    expect(current_path).to eq '/users/new'
    expect(page).to have_content 'Email has an invalid format'
  end

  scenario 'a user\'s email is unique' do
    create_test_user
    expect { sign_up(username: 'cat') }.not_to change { User.count }
    expect(current_path).to eq '/users/new'
    expect(page).to have_content 'Email is already taken'
  end

  scenario 'a user\'s username is unique' do
    create_test_user
    expect { sign_up(email: 'green@example.com') }.not_to change { User.count }
    expect(current_path).to eq '/users/new'
    expect(page).to have_content 'Username is already taken'
  end

  scenario 'a user cannot sign up with no email' do
    expect { sign_up(email: nil) }.not_to change { User.count }
    expect(current_path).to eq '/users/new'
    expect(page).to have_content 'Email must not be blank'
  end

  scenario 'a user cannot sign up with no username' do
    expect { sign_up(username: nil) }.not_to change { User.count }
    expect(current_path).to eq '/users/new'
    expect(page).to have_content 'Username must not be blank'
  end

  scenario 'a user cannot sign up with no name' do
    expect { sign_up(name: nil) }.not_to change { User.count }
    expect(current_path).to eq '/users/new'
    expect(page).to have_content 'Name must not be blank'
  end

  scenario 'a user cannot sign up with no password' do
    expect { sign_up(password: nil, password_confirmation: nil) }.not_to change { User.count }
    expect(current_path).to eq '/users/new'
    expect(page).to have_content 'Password must not be blank'
  end

  scenario 'a user\'s password and password_confirmation must match' do
    expect { sign_up(password_confirmation: 'failure') }.not_to change { User.count }
    expect(current_path).to eq '/users/new'
    expect(page).to have_content 'Password does not match the confirmation'
  end
end
