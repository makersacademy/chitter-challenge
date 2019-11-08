require 'pg'

def create_post
  visit '/new_peep'
  fill_in('title', with: 'New Peep')
  fill_in('body', with: 'This is a test peep')
  click_button("submit")
end