feature 'User Sign-Up:' do
  scenario 'can sign-up as new user'
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, banana@example.com')
    expect(User.first.email).to eq 'banana@example.com'
  end

  def sign_up(email: 'banana@example.com', 
              password: 'banana123', 
              password_confirmation: 'banana123')
      visit '/users/new'
      expect(page.status_code).to eq(200)
      fill_in :email, with: email
      fill_in :password, with: password
      fill_in :password_confirmation, with: password_confirmation
      click_button 'Sign up'
  end
end