require './app/models/user'
feature 'User sign up' do
  scenario 'I can sign up as a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, jack.halltipping@gmail.com')
    expect(User.first.email).to eq('jack.halltipping@gmail.com')
  end

  def sign_up(email: 'jack.halltipping@gmail.com',
              name: 'Jack',
              username: 'therealjht',
              password: '12345678',
              password_confirmation: '12345678')
    visit '/users/new'
    fill_in :email,    with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'Sign up'
  end

  scenario 'with a password that does not match' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(status_code).to eq 200
    expect(page).to have_content('Password does not match the confirmation')
  end

  scenario 'with an email that is already registered' do
    sign_up
    expect { sign_up }.to change(User, :count).by(0)
    expect(page).to have_content('This email is already taken')
  end
end
