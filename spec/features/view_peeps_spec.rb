require './app/models/peep'

feature "peep list" do
  scenario "User can view a list of all peeps without login" do
    Peep.create(content: "My first peep", name: "Bob", username: "bob123")
    visit '/peeps'
    expect(page.status_code).to eq 200
    within "ul#peeps" do
      expect(page).to have_content "My first peep"
    end
  end
  scenario "User can see the name of the peep author" do
    Peep.create(content: "My first peep", name: "Bob", username: "bob123")
    visit '/peeps'
    within "ul#peeps" do
      expect(page).to have_content "Bob"
    end
  end
  scenario "User can see the username of the peep author" do
    Peep.create(content: "My first peep", name: "Bob", username: "bob123")
    visit '/peeps'
    within "ul#peeps" do
      expect(page).to have_content "bob123"
    end
  end
  scenario "User can see the time of peep" do
    Peep.create(content: "My first peep", name: "Bob", username: "bob123", created: "22:00")
    visit '/peeps'
    within "ul#peeps" do
      expect(page).to have_content "22:00"
    end
  end


end
