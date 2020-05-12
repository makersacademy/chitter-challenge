def add_peep(text)
  fill_in 'message', with: text
  click_button 'Peep'
end
