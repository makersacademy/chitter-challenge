feature "Home page loads" do
  scenario "has content on the home page" do
    visit '/'
    expect(page).to have_content "Welcome to Chitter"
  end
end

feature "User can send a peep" do
  scenario "Home page has a Compose Peep button" do
    visit '/'
    expect(page).to have_button "Compose Peep"
  end
end


feature "User wants to see other peeps" do
  scenario "displays peeps on the home page" do
    visit '/'
    expect(page).to have_content "User: Alex Peep: I miss the football! Time: 2020-04-11 14:12:12"
    expect(page).to have_content "User: Renata Peep: Time for some socially distanced excercise Time: 2020-04-10 12:00:05"
    expect(page).to have_content "User: Dave Peep: I think I deserve some chocolate Time: 2020-04-09 11:00:10"
  end
end
