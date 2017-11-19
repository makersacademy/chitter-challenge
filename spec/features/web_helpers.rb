def post_a_peep
  visit '/peeps/new'
  fill_in 'content', with: 'blablabla!'
  click_button 'Post'
end

def post_another_peep
  visit '/peeps/new'
  fill_in 'content', with: 'second peep'
  click_button 'Post'
end

def current_time
  Time.now.strftime("%H:%M:%S")
end
