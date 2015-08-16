feature 'User sign up' do

  scenario 'I can sign up as a new user to chitter' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, rich@gmail.com')
    expect(User.first.email).to eq('rich@gmail.com')
  end

  scenario 'requires a matching confirmation password' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
  end

  def sign_up(email: 'rich@gmail.com',
              password: '12345',
              password_confirmation: '12345')
      visit '/users/new'
      expect(page.status_code).to eq(200)
      fill_in :email, with: email
      fill_in :user_name; with: user_name
      fill_in :password, with: password
      fill_in :password_confirmation, with: password_confirmation
      click_button 'Sign Up'
  end
end