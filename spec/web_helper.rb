def sign_up( name: 'cat',
             username: 'CAT',
             email: 'cat@email.com',
             password: 'catsecret',
             password_confirmation: 'catsecret' )
    visit('/sign-up')
    fill_in :name, with: name
    fill_in :username, with: username
    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'Sign up'
end

def log_in( email: 'cat@email.com', password: 'catsecret' )
  visit('/log-in')
  fill_in(:email, with: "cat@email.com")
  fill_in(:password, with: "catsecret")
  click_button "Log in"
end
