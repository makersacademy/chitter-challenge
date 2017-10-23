def make_new_peep_feature
  visit '/peeps/new'
  fill_in :peep, with: "Remainers claim that leaving the EU..."
  click_button "Submit"
end
