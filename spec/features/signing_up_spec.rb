feature 'User signs up' do
  scenario 'allow to sign up as a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, bartklu')
    expect(User.first.email).to eq('bkluczynski@gmail.com')
  end

  scenario 'requires a matching confirmation password' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content 'Password does not match the confirmation'
  end


  def sign_up(email: 'bkluczynski@gmail.com',
              name: 'Bart',
              username: 'bartklu',
              password: '12345678',
              password_confirmation: '12345678')
    visit '/users/new'
    fill_in :email, with: email
    fill_in :name, with: name
    fill_in :username, with: username
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'Sign up'
  end

  scenario 'does not allow to sign up without an email' do
    expect { sign_up(email: nil)}.not_to change(User, :count)
    expect(page).to have_content 'Email must not be blank'
  end

  scenario 'does not allow to sign up without a valid email' do
    expect { sign_up(email: 'invalid@com')}.not_to change(User, :count)
    expect(page).to have_content 'Email has an invalid format'
  end




end
