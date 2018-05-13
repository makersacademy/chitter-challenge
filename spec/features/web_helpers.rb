def sign_up
  visit('/')
  click_button 'Sign Up'
  fill_in 'email', with: 'example@hotmail.co.uk'
  fill_in 'password', with: '1234'
  fill_in 'name', with: 'Sam Worrall'
  fill_in 'username', with: 'SW22'
  click_button 'Sign Up'
end

def post
  fill_in 'text', with: 'Hello World!'
  click_button 'Post new Peep'
end
