def add_new_post
  visit '/homepage'
  click_button 'New Post'

  fill_in 'content', with: 'This is a test post'
  click_button 'Submit'
end
