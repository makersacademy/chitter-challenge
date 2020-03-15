def create_peep
  visit('/new')
  fill_in('content', with: "this is a test peep")
  click_button("Submit")
end
