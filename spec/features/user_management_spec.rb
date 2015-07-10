feature 'User Sign-Up' do
  scenario 'can sign-up as new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, bananaman1')
    expect(User.first.email).to eq 'banana@example.com'
  end

  scenario 'requires matching confirmation password' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User,:count)
    expect(current_path).to eq('/users')
    expect(page).to have_content 'Password does not match the confirmation'
  end

  scenario 'I cannot sign up with an existing username' do
    sign_up
    expect { sign_up }.to change(User, :count).by(0)
    expect(page).to have_content('Username is already taken')
  end

  def sign_up(name: 'banana man',
              email: 'banana@example.com', 
              username: 'bananaman1',
              password: 'banana123', 
              password_confirmation: 'banana123'
              )
      visit '/users/new'
      expect(page.status_code).to eq(200)
      fill_in :name, with: name
      fill_in :email, with: email
      fill_in :username, with: username
      fill_in :password, with: password
      fill_in :password_confirmation, with: password_confirmation
      click_button 'Sign up'
  end
end