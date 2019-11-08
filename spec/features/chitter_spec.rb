require "capybara/rspec"

feature "it can call the website" do
  #   scenario "it can call the index page" do
  #     visit "/"
  #     expect(page).to have_content ("Hello World")
  #   end

  scenario "it can sign a user in" do
    visit("/")
    fill_in :username, with: "Sarah"
    click_button "Submit"
    expect(page).to have_content "Sarah"
  end
end
