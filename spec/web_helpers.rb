def post_first_blab
  visit '/'
  fill_in 'content', with: 'my first blab!'
  click_button 'blab'
end

def register_user
  visit '/'
  click_button 'create an account'
  fill_in 'username', with: 'The Testman'
  fill_in 'name', with: 'Testee McTest'
  fill_in 'email', with: 'test@testmail.com'
  fill_in 'password', with: 'p@$$w0rd'
  click_button 'register'
end
