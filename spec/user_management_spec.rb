# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter
feature 'User signs up' do
  scenario 'I can sign up as a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, tansaku')
    expect(User.first.username).to eq('tansaku')
  end

  scenario 'requires a matching confirmation password' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content 'Password does not match the confirmation'
  end

  scenario 'I cannot sign up without a username' do
    expect { sign_up(username: nil) }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content 'Username must not be blank'
  end

  scenario 'I cannot sign up without a email' do
    expect { sign_up(email: nil) }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content 'Email must not be blank'
  end

  scenario 'I cannot sign up with an invalid email address' do
    expect { sign_up(email: 'invalid@email') }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content 'Email has an invalid format'
  end

  scenario 'I cannot sign up with an existing username' do
    sign_up
    expect { sign_up(email: 'email@email.com') }.not_to change(User, :count)
    expect(page).to have_content('Username is already taken')
  end

  scenario 'I cannot sign up with an existing email' do
    sign_up
    expect { sign_up(username: 'username') }.not_to change(User, :count)
    expect(page).to have_content('Email is already taken')
  end
end

# As a Maker
# So that I can post messages on Chitter as me
# I want to log in to Chitter
feature 'User signs in' do
  let!(:user) do
    User.create(name: 'Samuel Russell Hampden Joseph',
                username: 'tansaku',
                email: 'sam@makersacademy.com',
                password: 's3cr3t',
                password_confirmation: 's3cr3t')
  end

  scenario 'with correct credentials' do
    sign_in(email: user.email, password: user.password)
    expect(page).to have_content "Welcome, #{user.username}"
  end

  scenario 'with incorrect credentials' do
    sign_in(email: user.email, password: 'wrong')
    expect(page).to have_content 'The email or password is incorrect'
  end
end

# As a Maker
# So that I can avoid others posting messages on Chitter as me
# I want to log out of Chitter
feature 'User signs out' do
  let!(:user) do
    User.create(name: 'Samuel Russell Hampden Joseph',
                username: 'tansaku',
                email: 'sam@makersacademy.com',
                password: 's3cr3t',
                password_confirmation: 's3cr3t')
  end

  scenario 'while being signed in' do
    sign_in(email: user.email, password: user.password)
    click_button 'Sign out'
    expect(page).to have_content('goodbye!')
    expect(page).not_to have_content "Welcome, #{user.username}"
  end
end