require_relative 'web_helpers'

feature "creating a peep" do
  scenario "the user inputs a peep and sees a confirmation that its saved" do
    login
    expect(page).to have_content("First peep")
  end
end
