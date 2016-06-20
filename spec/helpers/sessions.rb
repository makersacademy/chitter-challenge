module SessionHelpers

  def sign_in
    visit '/'
    fill_in 'email', with: 'bob@bob.com'
    fill_in 'password', with: 'password'
    click_button 'Sign in'
  end

  def sign_out
    click_button 'Sign out'
  end
  
end
