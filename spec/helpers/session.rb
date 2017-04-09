module SessionHelpers

  def sign_in(email:, password:)
    visit '/sessions/new'
    fill_in :email, with: email
    fill_in :password, with: password
    click_button 'Sign in'
  end

  def sign_up(email: 'test@test.com',
              password: 'password',
              password_confirmation: 'password',
              name: 'Test McTester',
              username: 'testalltheoutcomes')
    visit '/users/new'
    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    fill_in :name, with: name
    fill_in :username, with: username
    click_button 'Sign up'
  end


end
