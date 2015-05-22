module SessionHelper

  def sign_up(name='Alex', username='AlexHandy1', email='ah.com', password='test', password_confirmation='test')
    visit ('/users/new')
    within('#sign-up') do
      fill_in :name, with: name
      fill_in :username, with: username
      fill_in :email, with: email
      fill_in :password, with: password
      fill_in :password_confirmation, with: password_confirmation
      click_button "Sign up"
    end
  end

  def sign_in(email='ah.com', password='test')
    visit ('/sessions/new')
      fill_in :email, with: email
      fill_in :password, with: password
    click_button "Sign in"
  end

end