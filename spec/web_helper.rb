def fill_form

visit('/')
click_button 'Add peep'
  fill_in('peep_message', :with => 'Peep-peep-peep')
click_button 'Peep it!'

end




def see_wall

visit('/')
click_button 'Show peeps'

end