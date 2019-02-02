def submit_a_peep(peep)
  visit '/'
  fill_in 'new_peep', with: peep
  click_button 'Post'
end
