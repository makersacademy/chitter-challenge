module SessionHelpers

  def sign_up(email: 'ruan@email.com',
              password: 's3cr3t',
              name: 'Ruan',
              user_name: 'ruan')
    visit '/users/new'
    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password
    fill_in :name, with: name
    fill_in :user_name, with: user_name
    click_button 'Sign up'
  end


# add login here
end
