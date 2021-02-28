def sign_up_for_chitter
  visit('/')
  click_link('sign up for Chitter')
  fill_in 'email', with: 'bobloblaw@lawblog.com'
  fill_in 'password', with: 'bobloblawslawblog'
  fill_in 'name', with: 'Bob Loblaw'
  fill_in 'username', with: 'bloblaw'
  click_button 'Submit'
end

def sign_in_to_chitter
  user = User.create(email: 'bobloblaw@lawblog.com', password: 'bobloblawslawblog', name: 'Bob Loblaw', username: 'bloblaw')
  visit('/')
  click_link('Log in')
  fill_in 'username', with: 'bloblaw'
  fill_in 'password', with: 'bobloblawslawblog'
  click_button 'Submit'
end
