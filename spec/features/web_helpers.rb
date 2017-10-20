def make_new_post
  visit '/posts/new'
  fill_in :tip, with: "Remember to eat your greens!"
  click_button "Submit"
end
