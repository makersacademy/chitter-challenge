def create_a_peep
  visit '/peeps/new'
  fill_in 'message', with: 'A peep with a hashtag'
  fill_in 'hashtags', with: 'first'
  click_button 'Post Peep!'
end
