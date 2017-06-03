def make_peep
  visit "/"
  click_button "Make a Peep"
  fill_in "peep", with: "Lorem ipsum dolor sit amet."
  click_button "Release the Peep"
end
