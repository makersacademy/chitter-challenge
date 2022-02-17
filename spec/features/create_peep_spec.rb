# feature "creating a peep" do
#   scenario "the user inputs a peep and sees a confirmation that its saved" do
#     visit '/peeps/new'
#     fill_in :peep, with: "First peep"
#     fill_in :time_of_peep, with: "12:30pm"
#     click_button "submit"
#     expect(page).to have_content("First peep", "12:30pm")
#     end
# end