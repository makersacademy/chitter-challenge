require "capybara/rspec"

feature "it can call the website" do
  scenario "it can call the index page" do
    visit "/"
    expect(page).to have_content ("Hello World")
  end
end
