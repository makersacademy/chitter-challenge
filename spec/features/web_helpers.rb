def add_chit(post,tag)
  visit('/new')
  fill_in(:post, with: post)
  fill_in(:tags, with: tag)
  click_button("Chit")
end
