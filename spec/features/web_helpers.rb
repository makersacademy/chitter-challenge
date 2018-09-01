def submit_peep
  visit("/")
  fill_in 'new_peep', with: "This is the first post."
  click_button 'Submit'
end
