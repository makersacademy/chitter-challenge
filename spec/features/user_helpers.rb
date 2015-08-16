module Features
  module UserHelpers

    def sign_up(user)
      visit '/'
      expect(page.status_code).to eq(200)
      click_link 'create a new account'
      fill_in 'email', with: user.email
      fill_in 'username', with: user.username
      fill_in 'name', with: user.name
      fill_in 'password', with: user.password
      fill_in 'password_confirmation', with: user.password_confirmation
      click_button 'Sign me up!'
    end

  end
end
