def new_post
  visit '/posts/new'
  fill_in 'content', with: 'Hello World!'
  click_button 'Submit'
end
