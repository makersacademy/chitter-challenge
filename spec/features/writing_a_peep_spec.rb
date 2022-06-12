feature "Write a peep" do 
  scenario "A user can write a peep and it to the rest" do 
  visit('/chitter/peeps/new')
  fill_in('message', with: "Live from VScode, this if my first peep!")
  click_button('Submit')

  expect(page).to have_content "Live from VScode, this if my first peep!"
  end 
end 