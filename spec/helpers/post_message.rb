def post_message(peep)
  visit '/peeps/new'
  fill_in :message, with: peep.message
  click_button 'Post Peep'
end
