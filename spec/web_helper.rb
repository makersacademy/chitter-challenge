def sign_up(email: 'mail@marioribeiro.com',
            password: 'mypassword',
            username: 'marioribeiro')
  visit '/users/new'
  within 'form#signup-form' do
    fill_in :email,    with: email
    fill_in :username, with: username
    fill_in :password, with: password
    click_button 'Signup'
  end
end

def sign_in(email: 'mail@marioribeiro.com',
            password: 'mypassword')
  visit '/'
  fill_in :email,    with: email
  fill_in :password, with: password
  click_button 'Sign In'
end
