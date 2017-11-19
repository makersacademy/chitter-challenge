def post_peep
  visit "/new_peep"
  fill_in("peep", with: "This is a test peep")
  click_button "Post"
end
