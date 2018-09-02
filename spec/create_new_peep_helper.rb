def create_new_peep(body)
  visit("/write_message")
  fill_in "name", with: "Author Name"
  fill_in "username", with: "username"
  fill_in "message", with: body
  click_button "Save"
end
