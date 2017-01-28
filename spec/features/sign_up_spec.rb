# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter

feature 'User sign up:' do
  scenario 'I can sign in as new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content("Welcome, test@test.com")
    expect(User.first.email).to eq('test@test.com')
  end

  scenario 'User cant sign in with a blank email address' do
    expect { sign_up(email: nil) }.not_to change(User, :count)
    expect(page).to have_content("Email must not be blank")
  end

  scenario 'User cant sign in with a blank name' do
    expect { sign_up(name: nil) }.not_to change(User, :count)
    expect(page).to have_content("Name must not be blank")
  end

  scenario 'User cant sign in with a blank username' do
    expect { sign_up(username: nil) }.not_to change(User, :count)
    expect(page).to have_content("Username must not be blank")
  end

  scenario 'Make sure that the password and password_confirmation match' do
    expect{sign_up(password_confirmation: 'wrong')}.not_to change(User, :count)
    expect(page).to have_content('Password does not match')
    expect(current_path).to eq('/users/new')
  end

  scenario 'User cant sign in without valid email' do
    sign_up
    expect { sign_up(email: "test.com") }.not_to change(User, :count)
    expect(page).to have_content("Email has an invalid format")
  end
end
