def create_peep
  click_button 'New Peep'
  fill_in :peep, with: "Hello Chitter"
  click_button "Submit"
end
