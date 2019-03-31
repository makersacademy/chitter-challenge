def add_cheep(post)
  visit '/'
  fill_in 'content', with: post
  click_button 'Post'
end
