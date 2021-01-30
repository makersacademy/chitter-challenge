require 'pg'

feature "It can add a new peep" do

  scenario "it allows the user to add a new peep" do
    visit('/')
    click_on("peep")
    expect(page).to have_content("Transmit your thoughts to the world")
  end

  scenario "it has a form that accepts peeps" do
    visit('/')
    click_on("peep")
    fill_in("peep", with: "Testing")
  end

  scenario "it displays peeps on the index page" do
    visit('/')
    click_on("peep")
    fill_in("peep", with: "This is a test")
    click_on("send")
    expect(page).to have_content("This is a test")
  end

end
