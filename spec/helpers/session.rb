module SessionHelpers

  def sign_up(email: 'echai93@gmail.com',
              password: 'brocolli',
              password_confirmation: 'brocolli')
    visit '/users/new'
    fill_in(:email, with: 'echai93@gmail.com')
    fill_in(:password, with: 'brocolli')
    fill_in(:password_confirmation, with :'brocolli')
    click_button 'Sign up'
  end

  def sign_in(email:, password:)
    visit '/sessions/new'
    fill_in(:email, with: 'echai93@gmail.com')
    fill_in(:password, with: 'brocolli')
    click_button 'Log in'
  end

end 
