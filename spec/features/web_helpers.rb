def sign_in_and_peep
  visit "/"
  fill_in :name, with: 'jenny'
  click_button "submit"
  fill_in :peep, with: 'Enter your peep and share it with the world!'
  click_button "post"
end
