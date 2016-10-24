module SessionHelpers

  def sign_up(email: 'test@tester.com',
              name: "JCB Bulldozer",
              nickname: "the_bull",
              password: 'testpassword',
              password_confirmation: 'testpassword')
    visit '/users/new'
    fill_in :email, with: email
    fill_in :name, with: name
    fill_in :nickname, with: nickname
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'Sign up'
  end

  def sign_in(email:, password:)
    visit '/sessions/new'
    fill_in :email, with: email
    fill_in :password, with: password
    click_button 'Sign in'
  end

end
