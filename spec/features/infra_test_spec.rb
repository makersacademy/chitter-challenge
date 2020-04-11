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
    expect(page).to have_content "I miss the football!"
    expect(page).to have_content "Time for some socially distanced excercise"
    expect(page).to have_content "I think I deserve some chocolate"
  end
end
