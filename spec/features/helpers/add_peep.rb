def add_peep(text)
  fill_in :peep, :with => text
  click_button 'Add peep'
end