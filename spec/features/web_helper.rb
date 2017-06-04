def create_new_peep
  visit('/peeps/new')
  fill_in('new_peep', :with => 'test')
  click_button('PEEP')
end
