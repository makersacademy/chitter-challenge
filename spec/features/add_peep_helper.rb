# require './spec/features/add_peep_helper'

def user_peeps
  fill_in("peep_content", with: 'I love glitter')
  fill_in('peep_username', with: "glitterati")
  click_button('Peep')
end
