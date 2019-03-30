# require_relative "../../app.rb"

feature "Homepage" do
  scenario "welcomes user to Chitter" do
    visit "/"
    expect(page).to have_content "Welcome to Chitter"
  end
end