# require './spec/features/sign_up_helper'

def user_signs_up
  visit '/signup'
  fill_in('username', with: 'Peeping Tom')
  fill_in('password', with: 'ilikepeeping')
  click_button('Submit Details')
end
