require_relative '../../app'

feature "Infrastructure works" do
  scenario "Lands on Homepage" do
    visit('/')
    expect(page).to have_content("Welcome to Chitter")
  end
end
