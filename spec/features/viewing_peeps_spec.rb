require 'pg'

feature "Viewing peeps" do

  scenario "a user can see a list on the peep page" do
    visit "/peeps"
    expect(page).to have_selector "ul"
  end

  scenario "a user can see list of peeps from other users" do
    # Add test data
    user = create_test_user
    Peep.create(peep: "Test peep", user_id: user.id)
    visit "/peeps"
    expect(page).to have_content "Test peep"
  end

# As a maker
# So that I can see what others are saying  
# I want to see all peeps in reverse chronological order

  scenario "user can see list of peeps from other users with the most recent first" do
    # Add test data
    user = create_test_user
    Peep.create(peep: "First peep", user_id: user.id)
    Peep.create(peep: "Second peep", user_id: user.id)
    Peep.create(peep: "Newest peep", user_id: user.id)
    visit "/peeps"
    expect(page.body.index('Newest peep')).to be < page.body.index('First peep')
  end

  # As a Maker
  # So that I can better appreciate the context of a peep
  # I want to see the time at which it was made

  scenario "user can see when peeps were posted" do
    # Add test data
    user = create_test_user
    Peep.create(peep: "Peep with timestamp", user_id: user.id)
    created_at = Peep.all[0].created_at
    visit "/peeps"
    expect(page).to have_content(created_at)
  end

end
