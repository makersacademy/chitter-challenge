def make_peep
  visit "/"
  click_button "Make a Peep"
  fill_in "peep", with: "Lorem ipsum dolor sit amet."
  click_button "Release the Peep"
end

def register_user
  visit "/"
  click_button "Register New User"
  fill_in "name", with: "Test"
  fill_in "email", with: "test@fake.com"
  click_button "register"
end
