# As a maker
# So that I can see what others are saying  
# I want to see all peeps in reverse chronological order (most recent first)

require 'pg'

feature "Viewing peeps" do
  scenario "user can see list" do
    visit "/peeps"
    expect(page).to have_selector "ul"
  end

  scenario "user can see list of peeps" do
    # Add test data
    Peep.create(message: "Test peep")
    
    visit "/peeps"
    expect(page).to have_content "Test peep"
  end

  scenario "user can see list of peeps with most recent first" do
    # Add test data
    Peep.create(message: "Oldest peep")
    Peep.create(message: "Middle peep")
    Peep.create(message: "Newest peep")

    visit "/peeps"
    first_child = find("ul li:first-child")
    last_child = find("ul li:last-child")
    expect(first_child).to have_content "Newest peep"
    expect(last_child).to have_content "Oldest peep"
  end

  # As a Maker
  # So that I can better appreciate the context of a peep
  # I want to see the time at which it was made

  scenario "user can see when peeps were posted" do
    # Add test data
    Peep.create(message: "Peep with timestamp")

    created_at = Peep.all[0].created_at
    visit "/peeps"
    expect(page).to have_content(created_at)
  end
end
