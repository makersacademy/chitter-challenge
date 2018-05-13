def visit_homepage_create_cheep(message)
  visit '/'
  click_button('Create Cheep')

  fill_in('name', :with => 'Celine Dione')
  fill_in('handle', :with => '@celinedione')
  fill_in('message', :with => message)
  click_button('Cheep!')
end
