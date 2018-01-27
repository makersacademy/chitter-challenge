def post_peep(peep)
  visit 'peeps/new'
  fill_in 'post', with: peep
  click_button 'Post Peep!'
end
