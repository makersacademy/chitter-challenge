def post_peep_to_chitter
  visit('/chitter')
  fill_in 'peep', with: 'First peep'
  click_button 'Post Peep'
end