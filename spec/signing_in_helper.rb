def signs_in_successfully
  visit '/signup'
  fill_in :email, with: 'example@email.com'
  fill_in :name, with: 'Jack Dorsey'
  fill_in :username, with: 'jack'
  click_button 'Submit'
end
