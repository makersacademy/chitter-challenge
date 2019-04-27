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
