module SessionHelpers
  def sign_up(email: 'mali@test.com',
              password: '12345',
              full_name: 'Mali Michael',
              username: 'mali')
    visit 'users/new'
    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :full_name, with: full_name
    fill_in :username, with: username
    click_button 'Sign up'
  end

  def sign_in(email:, password:)
    visit 'sessions/new'
    fill_in :email, with: email
    fill_in :password, with: password
    click_button 'Sign in'
  end

  def send_peep
    visit '/peeps'
    fill_in :peep, with: 'This is a test peep'
    click_button 'Send peep'
  end

end
