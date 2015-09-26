feature 'User sign up' do

  def sign_up(user)
      visit '/'
      click_button 'Sign up'
      fill_in :email,     with: user.email
      fill_in :password,  with: user.password
      fill_in :password_confirmation, with: user.password_confirmation
      fill_in :name,      with: user.name
      fill_in :username,  with: user.username
      click_button 'Register'
  end

  scenario 'I can sign up as a new user' do
    user = build(:user)
    expect { sign_up user }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, alice@example.com')
    expect(User.first.email).to eq('alice@example.com')
  end

  scenario 'requires a matching confirmation password' do
    user = build(:user, password_confirmation: 'wrong')
    expect { sign_up user }.not_to change(User, :count)
    expect(page).to have_content 'Password and confirmation password do not match'
  end

  scenario 'cant sign up without entering an email' do
    user = create(:user, email: '')
    expect { sign_up user }.not_to change(User, :count)
    expect(page).to have_content 'Email must not be blank'
  end

end
