feature 'User sign in' do

  let!(:user) do
    User.create(email: 'user@example.com', handle: 'user12', password: 'secret1234', password_confirmation: 'secret1234')
  end

    scenario 'with correct credentials' do
      sign_in(email: user.email, password: user.password)
    end

    def sign_in(email:, password:)
      visit '/sessions/new'
      fill_in :email, with: email
      fill_in :password, with: password
      click_button 'Sign in'
    end

end
