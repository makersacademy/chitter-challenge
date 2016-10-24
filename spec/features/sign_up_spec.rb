feature 'User sign up' do

  scenario 'you can sign up as a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, JamesX')
    expect(User.first.email).to eq('james@example.com')
  end

  scenario 'you have to use a unique email' do
    sign_up
    click_button 'Sign Out'
    expect { sign_up }.not_to change(User, :count)
    expect(page).to have_content('Email is already taken')
  end

  scenario 'you have to use a unique user name' do
    sign_up
    click_button 'Sign Out'
    expect { sign_up }.not_to change(User, :count)
    expect(page).to have_content('User name is already taken')
  end

  scenario 'if you input wrong password conformation you won\'t sign up' do
    expect { sign_up(password_confirmation: 'wrong_password')}.not_to change(User, :count)
    expect(page).to have_content('Password does not match the confirmation')
  end

end
