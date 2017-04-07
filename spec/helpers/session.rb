module SessionHelpers

  def sign_up(email: 'ruan@email.com',
              password: 's3cr3t',
              password_confirmation: 's3cr3t',
              name: 'Ruan',
              user_name: 'ruan')
    visit '/users/new'
    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    fill_in :name, with: name
    fill_in :user_name, with: user_name
    click_button 'Sign up'
  end

  def sign_in(email: 'ruan@email.com', password: 's3cr3t')
    visit 'sessions/new'
    fill_in :email, with: email
    fill_in :password, with: password
    click_button 'Sign in'
  end

end
