def peep_first
  visit '/peeps/new'
  fill_in 'message', with: "I am posting my first peep"
  click_button 'Post peep'
end

def peep_second
  visit '/peeps/new'
  fill_in 'message', with: "This is my second peep"
  click_button 'Post peep'
end
