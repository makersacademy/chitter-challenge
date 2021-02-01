require 'pg'

feature "It can add a new peep" do

  scenario "it allows the user to add a new peep" do
    visit('/chitter')
    click_on("peep")
    expect(page).to have_content("p e e p !")
  end

  scenario "it has a form that accepts peeps" do
    visit('/chitter')
    click_on("peep")
    fill_in("peep", with: "Testing")
  end

  scenario "it displays peeps on the index page" do
    visit('/chitter')
    click_on("peep")
    fill_in("peep", with: "This is a test")
    click_on("send")
    expect(page).to have_content("This is a test")
  end

  scenario "it can hadndle apostrophes" do
    visit('/chitter')
    click_on("peep")
    fill_in("peep", with: "This isn't funny anymore")
    click_on("send")
    expect(page).to have_content("This isn't funny anymore")
  end

end
