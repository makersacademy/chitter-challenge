require "capybara/rspec"
require "capybara"

feature "it can call the website" do
  #   scenario "it can visit  the index page" do
  #     visit "/"
  #     expect(page).to have_content ("Hello World")
  #   end

  #   scenario "it can sign a user in" do
  #     visit("/")
  #     fill_in :username, with: "Sarah"
  #     click_button "Submit"
  #     expect(page).to have_content "Sarah"
  #   end

  scenario "it can allow user to make a peep" do
    visit("/")
    fill_in :username, with: "Sarah"
    click_button "Submit"
    fill_in :peep, with: "Hello World"
    click_button "Submit"
    expect(page).to have_content "Hello World"
  end
  #need to sort out  a test server
  scenario " it displays the username, peep and time" do
    visit("/peep_page")
    expect(page).to have_content "Sarah peeped: hello at: 15"
  end
end
