module SessionHelpers

  def sign_up (user_name: 'Edward',
              email: 'edwardkerry@gmail.com',
              password: 'password123',
              password_confirmation: 'password123')

    visit '/'
    click_button 'Sign Up'
    fill_in :user_name, with: user_name
    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'Submit'
  end

  def sign_in (email: 'edwardkerry@gmail.com',
                password: 'password123')
    visit '/sessions/new'
    fill_in :email, with: email
    fill_in :password, with: password
    click_button 'Sign in'
  end

  def peep
    click_link 'Compose a peep!'
    fill_in 'peep', with: 'This is Ed\'s peep'
    click_button 'Peep!'
  end

end
