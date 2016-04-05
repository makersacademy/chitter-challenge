def submit_peep
  fill_in :message, with: "I'm on Chitter!"
  click_button 'Peep!'
end

def submit_peep2
  fill_in :message, with: "Chitter chitter"
  click_button 'Peep!'
end
