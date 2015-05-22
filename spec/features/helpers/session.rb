module SessionHelpers

  def sign_up(email='uhoh@danieljohnston.co.uk',
              handle='uhoh',
              password='testpassword',
              password_confirmation='testpassword')
    visit '/users/new'
    fill_in :email, with: email
    fill_in :handle, with: handle
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'Sign up'
  end

  def sign_in(email='uhoh@danieljohnston.co.uk',
              password='testpassword')
    visit '/sessions/new'
    fill_in :email, with: email
    fill_in :password, with: password
    click_button 'Log in'
  end

end
