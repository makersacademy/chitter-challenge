def sign_up(name: 'Musashi',
            user_name: 'shogun',
            email: 'shogun@katana.com',
            password: 'harakiri!',
            password_confirmation: 'harakiri!')

  visit '/users/new'
  fill_in :name, with: name
  fill_in :user_name, with: user_name
  fill_in :email, with: email
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirmation
    click_button 'Sign up'
end

def sign_in(email:, password:)
  visit '/sessions/new'
  fill_in :email, with: email
  fill_in :password, with: password
  click_button 'Sign in'
end

