module Helpers
  def post_peep(message)
    visit '/peeps/new'
    fill_in :message, with: message
    click_button 'Submit'
  end

  def sign_up(username: 'tom', email: 'tom@test.com',
              password: 'Secret01', password_confirmation: 'Secret01')
    visit '/users/new'
    fill_in :username, with: username
    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'Sign Up'
  end

  def sign_in(username: 'tom', password: 'Secret01')
    visit '/sessions/new'
    fill_in :username, with: username
    fill_in :password, with: password
    click_button 'Sign In'
  end
end
