def post_message(post)
  visit '/posts/new'
  fill_in :message, with: post.message
  click_button "Post"
end
