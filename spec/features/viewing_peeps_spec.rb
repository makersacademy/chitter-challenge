require "pg"

feature "Viewing peeps" do
  feature "visiting the home page" do
    scenario "the page title is visible" do
      visit("/")
      expect(page).to have_content "Chitter"
    end
  end
end

feature "Viewing peeps" do
  scenario "peeps are visible" do
    connection = PG.connect(dbname: "chitter_test")

    Peep.create(text: "What a lovely day", name: "Iryna")
    Peep.create(text: "Hi", name: "Stacy")
    Peep.create(text: "Hello", name: "Andrey")

    visit ("/peeps")
    expect(page).to have_link("Iryna")
    expect(page).to have_link("Stacy")
    expect(page).to have_link("Andrey")
    
  end
end
