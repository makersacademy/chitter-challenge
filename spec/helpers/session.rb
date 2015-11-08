module SessionHelpers

  def login
    fill_in('username', with: 'test_account')
    fill_in('password', with: 'opensesam3')
    click_button('Log in!')
  end

  def test_sign_up
    visit('/users/sign-up')
    fill_in('username', with: 'test_account')
    fill_in('email', with: 'test@account.com')
    fill_in('name', with: 'Sinatra McCapybara')
    fill_in('password', with: 'opensesam3')
    fill_in('password_confirmation', with: 'opensesam3')
    click_button('Sign up!')
  end
end