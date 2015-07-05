feature 'User sign in' do
  let(:user) do
     User.create(email: 'user@example.com',
                 password: 'secret1234',
                 password_confirmation: 'secret1234')
     end

    def sign_in email:, password:
      visit '/sessions/new'
      fill_in :email, with: user.email
      fill_in :password, with: user.password
    end

    scenario 'with correct credentials - is welcomed' do
      sign_in(email: user.email, password: user.password)
      click_button 'Sign in'
      expect(page).to have_content "Welcome, #{user.email}"
    end

end