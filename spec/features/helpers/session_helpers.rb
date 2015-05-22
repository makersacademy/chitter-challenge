module SessionHelper

  def sign_up(name='Alex', username='AlexHandy1', email='ah.com', password_digest='test')
    visit ('/users/new')
    within('#sign-up') do
      fill_in :name, with: name
      fill_in :username, with: username
      fill_in :email, with: email
      fill_in :password_digest, with: password_digest
      click_button "Sign up"
    end
  end

end