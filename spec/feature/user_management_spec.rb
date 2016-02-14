# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter

feature 'User sign up' do

  scenario 'I can sign up as a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, Iryna')
    expect(User.first.email).to eq('iryna@mail.com')
  end

  scenario 'with a password that does not match' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content 'Password does not match the confirmation'
  end

  scenario 'I cannot sign up without an username' do
    expect { sign_up(username: nil) }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Username must not be blank')
  end

 scenario 'I cannot sign up without an email address' do
    expect { sign_up(email: nil) }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content('Email must not be blank')
  end

  scenario "I can't sign up with invalid email address" do
    expect { sign_up(email: "invalid@email") }.not_to change(User, :count)
  end

  scenario 'I cannot sign up with an existing email or username' do
    sign_up
    expect { sign_up }.to_not change(User, :count)
    expect(page).to have_content('Email is already taken')
    expect(page).to have_content('Username is already taken')
  end


end