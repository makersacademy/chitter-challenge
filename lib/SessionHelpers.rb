module SessionHelpers
  def sign_in(username, password)
    visit '/sessions/new'
    fill_in 'username', with: username
    fill_in 'password', with: password
    click_button 'Sign in'
  end

  def sign_up(email = 'Guillaume@chittest.com',
              username = 'Sexy_frenchman',
              name = 'Guillaume Bouffard',
              password = 'helloworld',
              password_confirmation = 'helloworld')
    visit '/users/new'
    expect(page.status_code).to eq(200)
    fill_in :email, with: email
    fill_in :username, with: username
    fill_in :name, with: name
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'Sign up'
  end
end
