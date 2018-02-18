def sign_in_and_peep
  visit "/"
  fill_in :name, with: 'jenny'
  click_button "submit"
end
