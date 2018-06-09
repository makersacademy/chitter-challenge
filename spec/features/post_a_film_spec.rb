# As a user
# So that I can let people know what I think of a film
# I want to post a film to faldo-movie-ratings.

feature 'Add a film' do
  scenario 'User can add a film' do
    # Setup
    visit("/")
    click_button("addfilm")
    fill_in("title", with: "My first film review")
    fill_in("rating", with: "8")
    # Exercise
    click_button("Submit")
    # Verify
    expect(page).to have_content("My first film review")
    expect(page).to have_content("8/10")
  end

  scenario 'User must enter all fields' do
    visit("/")
    click_button("addfilm")
    fill_in("title", with: "Example Film Title")
    click_button("Submit")
    # Verify
    expect(page).to have_content("You must enter all fields to submit")
    expect(page).not_to have_content("Example Film Title")
  end
end
