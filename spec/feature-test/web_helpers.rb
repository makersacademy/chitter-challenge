def peep_first
  visit '/peeps/new'
  fill_in 'msg', with: "Hi, this is peep1"
  click_button 'Create peep'
end

def peep_second
  visit '/peeps/new'
  fill_in 'msg', with: "Hi, this is peep2"
  click_button 'Create peep'
end

def peep_third
  visit '/peeps/new'
  fill_in 'msg', with: "Hi, this is peep3"
  click_button 'Create peep'
end
