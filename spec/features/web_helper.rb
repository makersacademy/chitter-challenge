def submit_peep
  fill_in :message, with: "I'm on Chitter!"
  click_button 'Peep!'
end
