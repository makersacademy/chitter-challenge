module SessionHelpers

  def sign_up(email: 'elinnet@gmail.com', name: 'Elin', password: 'password', password_confirmation: 'password')
      visit '/user/new'
      expect(page.status_code).to eq(200)
      fill_in :email, with: email
      fill_in :name, with: name
      fill_in :password, with: password
      fill_in :password_confirmation, with: password_confirmation
      click_button 'Sign up'
  end

  def sign_in(email:, password:)
    visit '/sessions/new'
    fill_in :email, with: email
    fill_in :password, with: password
    click_button 'Login'
  end

end