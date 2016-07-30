module SessionHelpers

  def sign_up name: 'Ben',
              email: 'me@website.com',
              password: '123abc',
              confirm: '123abc'
    visit '/'
    fill_in :name, with: name
    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :confirm, with: confirm
    click_button 'Sign Up'
  end

  def sign_in email: 'me@website.com',
              password: '123abc'
    visit '/sessions/new'
    fill_in :email, with: email
    fill_in :password, with: password
    click_button 'Sign In'
  end

  def sign_out
    click_button 'Log Out'
  end

end
