# As a maker
# So that I can see what others are saying
# I want to see all peeps in reverse chronological order

feature "View peeps:" do
  scenario "User can view peeps in reverse chronological order." do
    visit('/')
    fill_in('user', with: "Day 1 user")
    fill_in('peep', with: "Day 1 peep")
    click_button "Submit"
    click_button "New peep"
    fill_in('user', with: "Day 2 user")
    fill_in('peep', with: "Day 2 peep")
    click_button "Submit"
    expect(page).to have_content "Day 2 user, Day 2 peep Day 1 user, Day 1 peep"
  end
end
