module SessionHelpers

  def sign_up(email: 'barney@barney.com',
              password: '4567',
              password_confirmation: '4567')
    visit '/users/new'
    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'Register'
  end
end
