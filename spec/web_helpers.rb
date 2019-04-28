def peep
  visit('/')
  fill_in 'content', with: 'Hello World'
  click_button 'Post'
  visit('/posts')
end

def peep_2
  visit('/')
  fill_in 'content', with: 'World Hello'
  click_button 'Post'
  visit('/posts')
end

def sign_up
  visit('/')
  click_link 'Sign Up'
  fill_in 'email', with: "heurich.gui@nomail.com"
  fill_in 'password', with: "pass12345"
  fill_in 'name', with: "Gui Heurich"
  fill_in 'username', with: "guiheurich"
  click_button 'Sign Up'
end
