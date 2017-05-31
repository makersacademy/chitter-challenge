def enter_details
  visit('/users/new')
  fill_in('name', :with => 'Tim Hawkins')
  fill_in('username', :with => 'therealtimhawkins')
  fill_in('email', :with => 'timhawkins@gmail.com')
  fill_in('password', :with => 'cliveallen')
end
