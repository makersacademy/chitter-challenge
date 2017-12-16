def peep_hello
  visit '/peep/new'
  fill_in 'peep', with: 'Hello you chitters'
  click_button 'submit'
end

def peep_christmas
  visit '/peep/new'
  fill_in 'peep', with: 'Merry Christmas'
  click_button 'submit'
end
