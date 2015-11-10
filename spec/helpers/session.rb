module SessionHelpers

  def login
    fill_in('username', with: 'test_account')
    fill_in('password', with: 'opensesam3')
    click_button('Log in!')
  end

  def test_sign_up
    visit('/users/new')
    fill_in('username', with: 'test_account')
    fill_in('email', with: 'test@account.com')
    fill_in('name', with: 'Sinatra McCapybara')
    fill_in('password', with: 'opensesam3')
    fill_in('password_confirmation', with: 'opensesam3')
    click_button('Sign up!')
  end

  def test_peep
    fill_in('peep body', with: 'test peep')
    click_button('Post Peep')
  end

end