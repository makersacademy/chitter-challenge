module SessionHelpers

  def sign_in(email:, password:)
    visit '/sessions/new'
    fill_in :email, with: email
    fill_in :password, with: password
    click_button 'Sign in'
  end

  def sign_up_correctly
    visit '/user/new'
    fill_in :username, with: 'catlover'
    fill_in :email, with: 'cat@cats.com'
    fill_in :password, with: 'ilovecats'
    fill_in :password_confirmation, with: 'ilovecats'
    click_button 'Sign up!'
  end

  def sign_up_incorrectly
    visit '/user/new'
    fill_in :username, with: 'catlover'
    fill_in :email, with: 'cat@cats.com'
    fill_in :password, with: 'ilovecats'
    fill_in :password_confirmation, with: 'ilovedogs'
    click_button 'Sign up!'
  end

  def create_peep(message)
    visit '/peeps/new'
    fill_in :new_peep, with: message
    click_button 'peep!'
  end

end
