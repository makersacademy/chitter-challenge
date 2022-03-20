
RSpec.feature "home_page", type: :feature do
  scenario "home page should have a welcome message displayed on it" do
    visit '/'

    expect(page).to have_content("Welcome to Chitter")
  end
end
