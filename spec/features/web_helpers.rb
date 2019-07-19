# frozen_string_literal: true

def post_peep(peep)
  visit('/')
  click_button('Post a peep!')
  fill_in('peep_text', :with => peep)
  click_button('Submit')
end
