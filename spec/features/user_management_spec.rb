feature 'Create user' do

  let!(:user) do
    User.create(email: 'user@user.com', password: 'password')
  end

  # I want to sign up for Chitter
  scenario 'can sign up a new user' do
    visit '/users/new'
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content 'Welcome, user@user.com'
    expect(User.first.email).to eq 'user@user.com'
  end

  # When a password does not match
  def sign_up(email: 'user@user.com',
              password: '12345678',
              password_confirmation: '12345678')
    visit '/users/new'
    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'Sign up'
  end

  scenario 'does not have a matching password' do
    expect { sign_up(password_confirmation: 'no') }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content 'Password and confirmation password do not match'
  end
end
