# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter

feature 'Sign Up' do
  scenario 'User registers' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content 'Welcome, john@doe.com'
    expect(User.first.email).to eq('john@doe.com')
  end

  scenario 'password match validation' do
    expect { sign_up(password_confirmation: 'notthepassword') }.not_to change(User, :count)
    expect(current_path).to eq('/signup')
    expect(page).to have_content 'Password does not match the confirmation'
  end

  scenario 'must enter a valid email' do
    expect { sign_up(email: nil) }.not_to change(User, :count)
    expect(page).to have_content('Email must not be blank')
  end

  scenario 'must enter a valid email' do
    expect { sign_up(email: 'john@doe') }.not_to change(User, :count)
    expect(page).to have_content('Email has an invalid format')
  end

  scenario 'must use unique email' do
    sign_up
    expect { sign_up }.not_to change(User, :count)
    expect(page).to have_content('Email is already taken')
  end
end
