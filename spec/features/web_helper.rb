def add_peep
  visit('/')
  click_link("Add Peep")
  fill_in("peep_content", with: "my first peep")
  click_button("Peep")
end
