feature 'User sign up' do

  scenario 'I can sign up as a new user to chitter' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, rich@gmail.com')
    expect(User.first.email).to eq('rich@gmail.com')
  end

  def sign_up(email: 'rich@gmail.com',
              password: '12345')
      visit '/users/new'
      expect(page.status_code).to eq(200)
      fill_in :email, with: email
      fill_in :password, with: password
      click_button 'Sign Up'
  end
end
