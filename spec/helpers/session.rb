module SessionHelpers

  def sign_in(email:, password:)
    visit '/sessions/new'
    fill_in :email, with: email
    fill_in :password, with: password
    click_button 'Sign In'
  end

  def sign_up(email: 'alice@example.com',
              password: '123',
              password_confirmation: '123')
    visit '/users/new'
    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'Sign Up'
  end
  
  def add_peep(message:)
    fill_in :message, with: message
    click_button 'Peep'
  end
end

