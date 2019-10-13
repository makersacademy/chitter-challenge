def log_in_post_peep 
  new_user
  log_in
  fill_in 'peep-content', with: "Test Peep"
  click_button "Peep"
end
