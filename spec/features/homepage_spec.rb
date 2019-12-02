feature 'Visit homepage' do
  scenario 'User can visit homepage and see a welcome message' do
    visit('/')
    expect(page).to have_content "Welcome to Chitter!"
  end

  scenario "User can see a form with a submit button" do
    visit('/')
    expect(page).to have_selector(:link_or_button, "Peep")
  end
end
