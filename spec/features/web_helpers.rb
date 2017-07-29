def new_post(text)
  visit '/posts/new'
  fill_in 'content', with: text
  click_button 'Submit'
end
