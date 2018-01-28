def add_peep(message)
  visit '/peeps/new'
  fill_in 'peep', with: message
  click_button 'Submit'
end
