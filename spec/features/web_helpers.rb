def submit_peep
  fill_in 'peep', with: 'testing'
  click_button 'peep'
end

def submit_peep_2
  fill_in 'peep', with: 't3sting2'
  click_button 'peep'
end
